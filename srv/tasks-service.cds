using { TaskManagement as db } from '../db/schema';

service TaskService {
    entity Tasks as projection on db.Tasks;
    action markAsComplete() returns Tasks;
}