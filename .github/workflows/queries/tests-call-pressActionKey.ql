/**
 * @description Find tests that call the function called pressActionKey
 * @kind problem
 * @id javascript/tests-call-pressActionKey
 * @problem.severity recommendation
 */
import javascript

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
where testCallsPressActionKey(test)
select test, "This test calls the function 'pressActionKey'."