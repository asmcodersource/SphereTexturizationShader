#define M_PI 3.1415926535897932384626433832795

vec3 vectorToSphere(vec2 uv, float distanceToCenter ){
    vec2 toPixelProject = vec2(uv.x-0.5, uv.y-0.5);
    float zDistance = sqrt(pow(distanceToCenter,2.0) - (pow(toPixelProject.x,2.0)+pow(toPixelProject.y, 2.0)));
    return vec3(toPixelProject.x, toPixelProject.y, zDistance+0.0);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    float distanceToCenter = .5;
    if( sqrt(pow(uv.x - 0.5, 2.0) + pow(uv.y-0.5, 2.0)) > distanceToCenter ){
        fragColor = vec4(0.0, 0.0, 0.0, 1);
        return;
    }
   
    vec3 upAxis = vec3(0.0, -distanceToCenter, 0.0);
    vec3 pixelPoint = vectorToSphere(uv, distanceToCenter);
    vec3 polarPoint = vec3(sin(iTime/7.0)*0.5, 0.0, cos(iTime/7.0)*0.5);
    
    // I have made mistake, so its fix witout looking on epressions
    vec3 swap = pixelPoint;
    pixelPoint = polarPoint;
    polarPoint  = swap;
    
    vec3 toPolar = polarPoint - pixelPoint;
    vec3 toPixel = normalize(pixelPoint); // defined just for
    float angleA = acos(dot(toPolar, -toPixel)/(length(toPolar)*length(toPixel)));
    float angleB = radians(90.0) - angleA;
    float projectDistance = sin(angleB)*length(toPolar);
    vec3 projectedPolarPoint = polarPoint + normalize(toPixel)*projectDistance;
    vec3 projectedToPolar = (projectedPolarPoint - pixelPoint);
    vec3 product1 = cross(upAxis, toPixel);
    vec3 product2 = cross(toPixel, product1);
    float angleG = acos(dot(product1, projectedToPolar)/(length(product1)*length(projectedToPolar)));
    float angleSign = dot(product2, projectedToPolar) > 0.0 ? 1.0 : -1.0; 
    float turnSign = length(toPolar) > sqrt(length(toPixel)*length(toPixel) + length(toPixel)*length(toPixel)) ? 1.0 : -1.0; 
    
    float polarAngle = ((angleG * angleSign) + M_PI) / (2.0*M_PI) + (iTime/30.0*turnSign);
    float polarDistance = acos(dot(pixelPoint, polarPoint)/(length(pixelPoint)*length(polarPoint)))*distanceToCenter;
    fragColor = texture(iChannel0, vec2(polarAngle, polarDistance));
}
