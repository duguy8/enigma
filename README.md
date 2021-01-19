## Enigma

Project spec: https://backend.turing.io/module1/projects/enigma/index

## Self Assessment

For functionality, I believe my Enigma project meets expectations. It has the Enigma Class with both encrypt & decrypt methods implemented and working as per the requirements, as well as the command line interface. It has the ability to encrypt & decrypt text files, correctly showing the key & date generated for each. I attempted the crack method, and was able to get the phrase cracked but unable to generate a new key.

I have implemented two modules (Rotation & Generator) which each serve an individual purpose. The Rotation module is responsible for rotating either forward for encrypting or backwards for decrypting. The Generator module is responsible for all things that are generated (generating a random number, generating the date in the correct format, generating the keys, generating the rotations. Also each class is encapsulated with minimal state being shared between them. The enigma class is only handling the creation of the encrypted hash. The encryption & decryption classes both have more state, and their primary behaviour is to deconstruct and put a phrase back together. Both of these classes can use methods from the generator and rotation modules. I feel the project is above expectations for the Object Oriented section of the rubric.

For Ruby Conventions & Mechanics I believe the project is also is above expectations. I have tried using different enumerables than I normally would reach for (each_char, reduce, each_with_index). I worked on being more dilligent in correcting my syntax as I go, and believe it looks much more tidy than my previous projects as a result. Along with this I also did my best to name things in a clear fashion. No methods are over 10 lines per the requirements (don't think any are past 8 actually). 

There is a test for every method in my test suites, and I used Simplecov along the way to monitor the coverage. As of my last pull request the coverage is at 100% for the rake file and each individual test. I also worked to address edge cases in my tests for encryption & decryption, testing for special characters, upcase, encrypting with only a phrase and no key or date. I have also implemented three tests with stubs to test for a current date to be generated, as well as a random key to be generated when one isn't supplied for encryption. Because of this I also believe my project is above expectations in this category as well. 

Overall I had 55 commits & 8 pull requests, and have implemented everything that was given to us in the requirements. I would have liked to get further with the crack method, but believe I have put forward a solid effort to show for my final Mod1 project. 


