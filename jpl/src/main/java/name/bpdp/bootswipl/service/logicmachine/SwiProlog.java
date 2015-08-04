package name.bpdp.bootswipl.service.logicmachine;

import java.util.Hashtable;
import org.jpl7.*;
import org.jpl7.Query;

public class SwiProlog {

	static String solution = "";

	public SwiProlog (String theory, String goal) {

		String t1 = "consult('" + theory  + "')";
		Query q1 = new Query(t1);

		if (q1.hasSolution()) {
			solution += " << Consult succeed >> ";
		} else {
			solution += " << Consult failed >> ";
		}

		String t2 = goal;
		Query q2 = new Query(t2);

		if (q2.hasSolution()) {
			solution += " << provable >> ";
		} else {
			solution += " << not provable >>";
		}
	}

	public String getSolutionResult() {
		return solution;
	}

}
