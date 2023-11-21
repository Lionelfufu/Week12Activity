/**
 * @description Find tests that call function call 'pressActionKey'
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

predicate callsPressActionKey(Function test) {
  exists(CallExpr call |
    call.getEnclosingFunction() = caller and
    call.getACallee().getName() = "pressActionKey"
  )
}

from Function test
where isTest(test) and
      callsPressActionKey(test)
select test, "This test calls the function 'pressActionKey'."