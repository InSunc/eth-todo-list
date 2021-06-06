pragma solidity ^0.5.0;

contract TodoList {

  enum TaskState { ToDo, Doing, Testing, Done }

  uint public taskCount = 0;

  struct Task {
    uint id;
    string content;
    TaskState state;
  }

  mapping(uint => Task) public tasks;

  event TaskCreated(
    uint id,
    string content,
    TaskState state 
  );

  event TaskStatusChanged(
    uint id,
    TaskState state
  );

  constructor() public {
    createTask("Check out dappuniversity.com");
  }

  function createTask(string memory _content) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, TaskState.ToDo);
    emit TaskCreated(taskCount, _content, TaskState.ToDo);
  }

  function changeState(uint _id, TaskState _state) public {
    Task memory _task = tasks[_id];
    _task.state = _state;
    tasks[_id] = _task;
    emit TaskStatusChanged(_id, _task.state);
  }
}
