public class MyClass { // Noncompliant, no sharing specified
        List<Case> lstCases = new List<Case>();
        for(Case c:[SELECT Id FROM Case WHERE Status = 'In Progress']) { // SOQL query
                // ...
        }
}

public class MyClass { // Noncompliant
        List<List<SObject>> sList = [FIND 'TEST' IN ALL FIELDS
                                     RETURNING Case(Name), Contact(FirstName,LastName)];  // SOSL query

}

public class MyClass { // Noncompliant
        List<Case> lstCases = new List<Case>();
        for(Case c:[SELECT Id, Status FROM Case WHERE Status = 'In Progress']) {
                c.Status = 'Closed';
                lstCasesToBeUpdated.add(c);
        }
        Update lstCasesToBeUpdated; // DML query
}
