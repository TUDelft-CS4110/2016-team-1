# Fuzzing with code fragments [1]

In order to apply fuzz testing to an interpreter, it would be useful if the fuzzed input is a semantically valid program.
If the fuzzed input were random, only the lexical and syntactical analysis of the interpreter would get tested.
These parts are simple compared to other parts of an interpreter, such as code transformation, just-in-time compilation, or execution of the code.
For javascript, one such framework is *jsfunfuzz*.
Holler et al. created a framework called *LangFuzz*, which allows black-box fuzz testing of engines based on a context-free grammar.
LangFuzz consists of roughly three parts: code mutation, code generation, and environment adjustments.

Code mutation consists of two phases: a learning phase and a mutation phase.
During the learning phase, sample code files is parsed using the language's grammar.
During the mutation phase, code fragments from a single file are randomly replaced with other fragments seen during the learning phase.
Many mutants are created from the original sample files.

Code mutation can only learn from old code.
Code generation focuses on producing new code, possibly generating code typically not seen in the mutation approach.
Using the language's grammar, a random walk over the tree of possible expansion series is performed.

When fragments are replaced, the new fragments might not be semantically valid.
For example, in some languages variables need to be declared before they're used.
In order to adjust for this, identifiers are replaced with identifiers occuring somewhere in the rest of the program.

In order to test the performance of LangFuzz, it was run in parallel with jsfunfuzz.
In total, LangFuzz and jsfunfuzz both found 3 defects that were the same.
jsfunfuzz discovered 15 defects that LangFuzz did not detect, LangFuzz detected 8 defects jsfunfuzz did not detect.
The authors conclude that they should be used complementary to each other.
The authors also proposed an approach to adapt LangFuzz to work on the PHP interpreter.
LangFuzz is built for easy adaptation to other languages.

In conclusion, LangFuzz is an effective tool in finding defects in interpreters.


# Taming compiler fuzzers [2]

Fuzzers are very effective at finding compiler bugs.
However, because fuzzers use random test cases, sometimes one bug is triggered multiple times.
Also, some of the bugs found are noncritical or known bugs.
Chen et al. describe the *fuzzer taming problem*: given a large collection of random test cases that trigger bugs, rank them such that distinct bugs are early in the list.
For evaluation, the expected bug discovery curve without any fuzzer taming is given as a baseline.
To tackle this problem, they define a distance function between test cases.
Many different distance functions were tested, such as the edit distance between compiler output, or the euclidean distance between tokenized test cases.
Using this distance function, they then sort test cases using the *first point first* (FPF) technique.
They also attempted to cluster similar tests and pick a test from a cluster to create a ranking.
However, in experiments this approach turned out to be more complex to use, more cmoputationally expensive, and less effective.
Test-case reduction, reducing the size of large tests while still inducing the same failure, was also found to play a big role.
Without test-case reduction, it was difficult to improve upon the baseline.
By *taming the fuzzer*, the same distinct bugs can be found several times faster than when a user inspects test cases at random.



[1] Holler C, Herzig K, Zeller A. Fuzzing with code fragments. InPresented as part of the 21st USENIX Security Symposium (USENIX Security 12) 2012 (pp. 445-458).
[2] Chen Y, Groce A, Zhang C, Wong WK, Fern X, Eide E, Regehr J. Taming compiler fuzzers. InACM SIGPLAN Notices 2013 Jun 16 (Vol. 48, No. 6, pp. 197-208). ACM.
