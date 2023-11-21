/**
 * @description Find tests that call the function called pressActionKey
 * @kind problem
 * @id javascript/tests-call-pressActionKey
 * @problem.severity recommendation
 */
import javascript

predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

predicate isPressActionKeyFunction(Function f) {
  f.getName() = "pressActionKey"
}

predicate testCallsPressActionKey(Function test) {
    exists(CallExpr call |
    call.getEnclosingFunction() = test and
    isPressActionKeyFunction(call.getACallee())
  )
}

from Function test
where isTest(test) and
      testCallsPressActionKey(test)
select test, "This test calls the function 'pressActionKey'."