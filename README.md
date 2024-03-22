# karate-gatling

# karate-gatling

Karate DSL vs Rest-Assured

Karate:
is easy to start with little coding
Native Json Support
In Rest assured You need to escape the special characters
like double quotes and stuff.
For Karate we can write the Json expression right in feature
files and karate will recognize the json.
Very powerfull JSON validations.
Rest assured doesn't have own assertion library.
We can use both java and JavaScript.
Rest assured is only java.
Karate have multi-thread parallel execution
Rest assured is not supported to run parallel execution
Karate have detailed reporting and logs
Using karate we can run performance tests with gatling

Cons
Karate have it own Karate scripting language(Gherkin Style)
No intellisense support in IDE --> For example if you have
any mistakes in spelling or putting your commands in the wrong
sequence IDE will not to help you to write your tests, you will see your error only when
you run your tests.

Verify this integratio


file: logback-test.xml --> used to set how you want to
see the logging on console