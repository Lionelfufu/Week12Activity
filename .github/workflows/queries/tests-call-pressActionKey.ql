/**
 * @description Find tests call 'pressActionKey'
 * @kind problem
 * @id javascript/tests-call-pressActionKey
 * @problem.severity recommendation
 */
import javascript


/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}



predicate testCallsPressActionKey(Function test) {
  exists(CallExpr call |
    call.getEnclosingFunction() = test and
    call.getCalleeName() = "pressActionKey"
  )
}


from Function test
where isTest(test) and
      testCallsPressActionKey(test)
select test, "This test calls the function 'pressActionKey'."
