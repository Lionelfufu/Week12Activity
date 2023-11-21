/**
 * @description Find fucntions called 'pressActionKey'
 * @kind problem
 * @id javascript/function-called-pressActionKey
 * @problem.severity recommendation
 */
import javascript


predicate isFunctionCalledPressActionKey(Function f) {
  f.getName() = "pressActionKey"
}


from Function f
where isFunctionCalledPressActionKey(f)
select test, "This test calls the function 'pressActionKey'."