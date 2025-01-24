using { TaskManagement as db } from '../db/schema';

service EmployeeService {
    entity Employees as projection on db.Employees excluding{
        password, modifiedAt, createdBy, modifiedBy
    };
}