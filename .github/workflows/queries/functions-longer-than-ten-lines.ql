/**
 * @description Find functions that are public method
 * @kind problem
 * @id javascript/functions-public-method
 * @problem.severity recommendation
 */
import javascript

/**
   * Holds if the given function is a public method of a class.
   */
  predicate isPublicMethod(Function f) {
    exists(MethodDefinition md | md.isPublic() and md.getBody() = f)
}
  /**
  * Holds if the given function is exported from a module.
  */
  predicate isExportedFunction(Function f) {
    exists(Module m | m.getAnExportedValue(_).getAFunctionValue().getFunction() =
  f) and
    not f.inExternsFile()
  }

from Function f
where isPublicMethod(f) and
      isExportedFunction(f)
select f, "This function is a public method"