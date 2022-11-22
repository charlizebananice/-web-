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
}
