import Option "mo:base/Option";
actor ToDoList {
  type Task = {
    title : Text;
    description : Text;
    isCompleted : Bool;
  };

  stable var currentTask : ?Task = null;

  // Function to add a new task
  public func addTask(title : Text, description : Text) : async Text {
    // Check if the task is null or if it's completed
    if (currentTask == null or Option.unwrap(currentTask).isCompleted == true) {
      currentTask := ?{
        title = title;
        description = description;
        isCompleted = false;
      };
      return "Task added successfully";
    };
    return "You already have a task! Complete it before adding a new one.";
  };

  // Function to mark the task as completed
  public func completeTask() : async Text {
    if (currentTask != null) {
      let task = Option.unwrap(currentTask); // Unwrap the optional
      if (task.isCompleted) {
        return "Task is already marked!";
      } else {
        // Mutate the currentTask value directly
        currentTask := ?{
          title = task.title;
          description = task.description;
          isCompleted = true;
        };
        return "Task is marked as complete!";
      };
    };
    return "No task found!";
  };

  // Function to view the current task
  public func viewTask() : async Text {
    if (currentTask != null) {
      let task = Option.unwrap(currentTask); // Unwrap the optional
      let status = if (task.isCompleted) { "Completed ✅" } else {
        "Pending ⏳";
      };
      return "📋 Task: " # task.title # "\n📝 Description: " # task.description # "\n📊 Status: " # status;
    } else {
      return "📭 No task available.";
    };
  };
};
