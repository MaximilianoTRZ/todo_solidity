//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

contract TaskContract{
    
    uint nextId; //autoincremental id

    // custom data type Task
    struct Task {
        uint id;
        string name;
        string description;
    }

    // array of tasks
    Task[] tasks;

    //CREATE
    function createTask(string memory _name, string memory _description) public {
        tasks.push(Task(nextId,_name,_description));
        nextId++;
    }

    //READ
    function readTask(uint _id) public view returns (uint, string memory, string memory) {
        uint index = findIndex(_id);
        return (tasks[index].id, tasks[index].name, tasks[index].description);
    }

    //UPDATE
    function updateTask(uint _id, string memory _name, string memory _description) public returns (uint, string memory, string memory) {
        uint index = findIndex(_id);
        tasks[index].name = _name;
        tasks[index].description = _description;
        return (tasks[index].id, tasks[index].name, tasks[index].description);
    }

    //DELETE
    function deleteTask(uint _id) public {
        uint index = findIndex(_id);
        delete tasks[index];
    }

    // auxiliar function to find a task index
    function findIndex(uint _id) internal view returns (uint) {
        for (uint i=0; i < tasks.length; i++) {
            if (tasks[i].id == _id) {
                return i;
            }
        }
        revert("Task not found.");
    }
}