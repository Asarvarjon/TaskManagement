using { TaskManagement as db } from '../db/schema';

service EmployeeService @(requires: 'authenticated-user') {
    entity Employees @(restrict: [
        {
            grant: [
                'READ',
                'WRITE',
                'UPDATE',
                'UPSERT',
                'DELETE'
            ], 
            to: 'Manager'
        }]) as projection on db.Employees excluding{
        password, modifiedAt, createdBy, modifiedBy
    };
}