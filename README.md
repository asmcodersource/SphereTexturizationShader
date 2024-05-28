# Polar Coordinate Shader

This shader demonstrates a method to convert a 2D texture mapped onto a plane into a representation of a sphere, using polar coordinates. It can be used for a variety of visual effects, such as simulating a spherical mapping of a texture, or for creating interesting visual distortions.

![image](https://github.com/asmcodersource/SphereTexturizationShader/assets/126491635/0edfd5ed-d9dd-4c98-8d11-f9faf64eb128)
[ShaderToy page](https://www.shadertoy.com/view/MflSzX)

## Features
- **Vector to Sphere Mapping**: Converts 2D UV coordinates to 3D coordinates on a sphere.
- **Polar Coordinate Transformation**: Transforms the sphere coordinates to polar coordinates, enabling texture mapping that respects spherical geometry.
- **Dynamic Movement**: Incorporates time-based dynamic movement of the texture, creating a visually appealing effect.

## Applications
- **Spherical Texture Mapping**: Ideal for projects requiring texture mapping onto spherical surfaces.
- **Visual Effects**: Can be used to create dynamic and interesting visual distortions for graphics or artistic projects.
- **Educational Tool**: Useful for learning about coordinate transformations, spherical geometry, and shader programming.

## Usage
This shader can be integrated into any GLSL-supported rendering environment and can be applied to textures to achieve the described effects. Adjustments to the parameters such as `distanceToCenter` and time-based transformations can be made to customize the effect for specific needs.

![image](https://github.com/asmcodersource/SphereTexturizationShader/assets/126491635/f8b4faf9-c608-4906-8a2f-81a3a6341566)
[Desmos model](https://www.desmos.com/3d/664746b06a)

Feel free to explore and modify the shader to suit your project requirements.
