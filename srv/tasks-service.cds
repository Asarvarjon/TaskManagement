using { TaskManagement as db } from '../db/schema';

service TaskService @(requires: 'authenticated-user') { 
    entity Tasks   @(restrict: [
        {
            grant: 'READ', 
            to: 'Viewer'
        },
        {
            grant: [
                'READ',
                'WRITE',
                'UPDATE',
                'UPSERT',
                'DELETE'
            ], 
            to: 'Manager'
        }])  as projection on db.Tasks;

    action markAsComplete() returns Tasks;
}


   