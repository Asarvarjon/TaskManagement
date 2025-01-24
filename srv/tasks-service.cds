using { TaskManagement as db } from '../db/schema';

service TaskService { 
    entity Tasks as projection on db.Tasks;
    action markAsComplete() returns Tasks;
}


    //  @(restrict: [
    //     {
    //         grant: 'WRITE', 
    //         to: 'Director'
    //     },
    //     {
    //         grant: [
    //             'READ',
    //             'WRITE',
    //             'UPDATE',
    //             'UPSERT',
    //             'DELETE'
    //         ], 
    //         to: 'Employee'
    //     }
        
    //     ]) 