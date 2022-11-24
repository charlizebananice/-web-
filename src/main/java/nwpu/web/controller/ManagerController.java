package nwpu.web.controller;

import nwpu.web.domain.Manager;
import nwpu.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @ResponseBody
    public String testJson(@RequestBody List<String> stringList){
        return null;
    }
    @PostMapping
    public Result save(@RequestBody Manager manager){
        boolean flag = managerService.saveManager(manager);
        return new Result(flag , flag ? Code.SAVE_OK : Code.SAVE_ERR);
    }

    @GetMapping
    public Result getAll(){
        List<Manager> data = managerService.getAllManager();
        return new Result(data,Code.GET_OK);
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id){
        Manager data = managerService.getManagerById(id);
        return new Result(data,Code.GET_OK);
    }


    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id){
        boolean flag = managerService.deleteManager(id);
        return new Result(flag , flag?Code.DELETE_OK : Code.DELETE_ERR);
    }

    @PutMapping
    public  Result update(@RequestBody Manager manager){
        boolean flag = managerService.updateManager(manager);
        return new Result(flag , flag ? Code.UPDATE_OK : Code.UPDATE_ERR);
    }
}
