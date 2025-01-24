const cds = require("@sap/cds");
const { message } = require("@sap/cds/lib/log/cds-error");

module.exports = cds.service.impl(async function() {
    this.before("CREATE", "Tasks", (req) => {
        const {deadline} = req.data;
         
        if(new Date(deadline) < new Date()) {
            req.error(400, 'Deadline must be in the future')
        }
    })


    this.on('markAsComplete', "Tasks", async(req) => {
        const { ID } = req.data;

        const task = cds.run(SELECT.from('Tasks').where({ID}));

        if(!task) req.error(400, 'Task not found!')

        if(task.status == 'Finished') {
            return {
                success: "false",
                message: "Task is already completed."
            }
        }

        await UPDATE("Tasks").set({status: "Finished"}).where({ID})

        return { success: true, message: 'Task marked as complete.' };
    })
})