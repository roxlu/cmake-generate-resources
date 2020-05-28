# Using Resource Generators with CMake

This repository shows a simple example how you can use the `xxd` 
util (found on most Linux distributions) to generate a `.h` file
that contains the binary data as one large array. You can add this
file as a source to your application. But this example is not about
`xxd`, it's about how you can use an custom command to generate
something that your target (e.g. executable) needs. Some things to
remember:

- You use `OUTPUT` to identify the file that you will generate
  using your `COMMAND` entries.

- Do not add the generated file to multiple different targets when 
  also using parallel builds. The custom command will be executed
  for each target that needs it; doing this in parallel results in
  issues. See [the manual][manual] for more info.
  
- You can pass multiple `COMMAND` lines.

- Make sure to add the generated `OUTPUT` to at least one target,
  otherwise it won't be executed.


[manual]: https://cmake.org/cmake/help/latest/command/add_custom_command.html
