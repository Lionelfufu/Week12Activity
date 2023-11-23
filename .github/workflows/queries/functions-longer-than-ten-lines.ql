/**
 * @description Find functions that are longer than ten lines of code
 * @kind problem
 * @id javascript/functions-longer-than-ten-lines
 * @problem.severity recommendation
 */
import javascript

predicate isFunctionLongerThanTenLines(Function f) {
  f.getNumLines() > 10
}

from Function f
where isFunctionLongerThanTenLines(f)
select f, "This function has more than 10 lines. "