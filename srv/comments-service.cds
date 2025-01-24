using { TaskManagement as db } from '../db/schema';

service CommentsService {
    entity Comments as projection on db.Comments;
}