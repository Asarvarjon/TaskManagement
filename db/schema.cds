using {cuid, managed} from `@sap/cds/common`;
namespace TaskManagement;

entity Tasks: cuid, managed {
    title: String @mandatory;
    description: String;
    status: Status default 'Created';
    priority: Priority @mandatory; 
    deadline: DateTime @mandatory;
    assigned_to: Association to Employees;
    assinged_by: Association to Employees;
}


entity Employees: cuid, managed{
    name: String;
    email: String;
    password: String;
    role: Role;
}

type Role: String enum {
    Director;
    Employee;
}


type Priority: String enum {
    Low;
    Medium;
    High;
    Critical;
}

type Status: String enum {
    Created;
    Assigned;
    Started;
    Finished;
    Aborted;
}