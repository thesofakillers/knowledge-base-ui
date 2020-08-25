# Zach Gollwitzer - Imperative vs. Declarative Programming (procedural, functional, and OOP) - 2020

## Imperative and Declarative

- Imperative: you describe _how_ to get what you want, giving step by step
  instructions
- Declarative: you describe _what_ you want, specifying your desired outputs.

### Abstraction

Abstraction is the process of concealing underlying details that may hamper
higher-level understanding and reasoning.

- Declarative programming enables abstraction: "give me what I want, I don't
  care how"
- Imperative programming inhibits abstraction: "here's exactly how I want you
  to give me what I want".

---

Behind every declarative abstraction, you will eventually find an imperative
implementation. In a way, this makes procedural programming, the purest form of
imperative programming.

Using functions is declarative, but the underlying function implementation may as well
have been imperative.

## Functional Programming

This is simply declarative abstraction via the use of functions

## Object Oriented Programming

This is simply abstraction (not necessarily purely declarative) via the use of
classes and their instances and methods.

## When to use what

- Functional: for occasions in which you have a fixed set of "things" and
  a possibly infinite set of operations to apply to them
- OOP: for occasions in which you have a fixed set of operations you need to
  apply to potentially infinite set of "things"
