# Building MSVC with ASan

As we start to push the rest of the company towards using dynamic analysis tools
such as Address Sanitizer and fuzzers, it's time to look inwards and treat our
own tooling with the same care and attention. The end point of this work is that
we are testing our tooling under ASan, and additionally fuzzing the compiler
regularly.

## Initial Work (Germanium)

Completing the following tasks will be considered a "success" for Germanium.

* [ ] A build of the compiler with ASan enabled, involving:
  - [x] use the building toolset's (`src/tools/vctools/dev14`) ASan runtime to build
    the compiler (this will likely involve moving the built ASan runtime into a
    subfolder, to be merged back in our release process);
  - [ ] a self-build where a first build (without ASan) builds the second compiler
    with ASan.
  - [x] bringing up the following binaries:
    + [x] `cl.exe`,
    + [x] `c1.dll`,
    + [x] `c2.dll`, and
    + [x] `link.exe`;
  - [x] we can build a simple "hello world" application, perhaps with
    continue-on-error; and finally,
  - [ ] we should bring up an optional pipeline which at least builds the compiler.
* [ ] Enable tests:
  - [ ] start testing under continue-on-error;
  - [ ] bring up a pipeline that builds at least some tests with an ASan-enabled
    compiler, with continue-on-error, so that we are not introducing additional
    bugs;
  - [ ] fix any issues in the compiler that prevent tests from being built without
    continue-on-error;
  - [ ] bring up a pipeline that builds at least some tests with an ASan-enabled
    compiler without continue-on-error; and
  - [ ] block RI upon the latter pipeline.

I believe that at least the first task is very reasonable in the Germanium
timeframe; the latter task has more uncertainty in it, since there is a
significant possibility of existing bugs which beget more bugs. I believe that
at least the continue-on-error work will be completeable within the timeframe.
I'm more concerned about the without-continue-on-error work. I do think,
however, that the continue-on-error work will be a significant benefit to our
workflow anyways, so I would consider my work to be a success even without the
blocking.

### Decisions to be Made

We have some important discussions ahead of us on how exactly this should work.
They will not really affect how the work is done, or what needs doing, but may
affect how developers interact with the work:

* [ ] Will the ASan-compiler tests block merging PRs?
  - [ ] for prod/be? for prod/fe?
* [ ] Should the tests be done with ret or chk? Both?
* [ ] How many/which tests do we want to run with the ASan compiler?
  - [ ] RWC?
