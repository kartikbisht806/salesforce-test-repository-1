trigger Opp_Related_task on Opportunity (after insert) {
	List<Task> tasksList = new List<Task>();
    for(Opportunity opp : Trigger.new){
        Task newTask = new Task(Subject = 'Follow up Task for Inserted Opportunity', whatId = opp.Id, OwnerId = opp.OwnerId);
        tasksList.add(newTask);
    }
    insert tasksList;
}