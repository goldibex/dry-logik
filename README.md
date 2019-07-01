dry-logik
=========

Some useful patterns for [dry.rb](https://dry-rb.org/) at Logikcull.

## Result

[Dry::Monads::Result](https://dry-rb.org/gems/dry-monads/result/) is a much
better way of handling failures than the usual `if foo.nil?` and wrapping everything
in `begin` blocks.

That said, it needs a little help to become the all-singing, all-dancing design
pattern everyone expects it to be. Particularly, we want:
  - better trace information from `Failure` objects naming the
    places in code where failures originated.
  - Fluent wrapping of code following the ordinary Ruby pattern (return bare
    objects, raise exceptions).

The code in `examples/failure.rb`, `examples/better_failure.rb`, and associated
specs in this repo exhibit one possible approach.

## Container

[Dry::System::Container](https://dry-rb.org/gems/dry-system/container/) is a
dependency-injection framework that can take a lot of the headache out of configuring
an application and keeping control at the bottom of the dependency tree where
it belonds.

What it doesn't come with is a clear set of batteries-included implementation patterns.

The code in `examples/di` in this repo shows a couple of different ways we might
use DI to solve some of our problems.
