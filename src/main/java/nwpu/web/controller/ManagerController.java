package nwpu.web.controller;

import nwpu.web.domain.common.Code;
import nwpu.web.domain.common.Result;
import nwpu.web.domain.entity.Manager;
import nwpu.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @ResponseBody
    public String testJson(@RequestBody List<String> stringList) {
        return null;
    }

    @PostMapping
    public Result save(@RequestBody Manager manager) {
        System.out.println("进入controller"+manager);
        boolean flag = managerService.saveManager(manager);
        System.out.println("出去");
        return new Result(flag, flag ? Code.SAVE_OK : Code.SAVE_ERR);
    }

    @GetMapping
    public Result getAll() {
        System.out.println("进入");
        List<Manager> data = managerService.getAllManager();
        System.out.println("data为"+data);
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        Manager data = managerService.getManagerById(id);
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/name/{managerName}")
    public Result getByName(@PathVariable String managerName) {
        List<Manager> data = managerService.getManagerByManagerName(managerName);
        return new Result(data, Code.GET_OK);
    }


    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        System.out.println("进入delete"+id);
        boolean flag = managerService.deleteManager(id);
        return new Result(flag, flag ? Code.DELETE_OK : Code.DELETE_ERR);
    }

    @PutMapping
    public Result update(@RequestBody Manager manager) {
        System.out.println("进入controller"+manager);
        boolean flag = managerService.updateManager(manager);
        return new Result(flag, flag ? Code.UPDATE_OK : Code.UPDATE_ERR);
    }

    /*@RequestMapping
    public String test() {
        System.out.println("测试。。。");
        return "test";
    }*/
}
