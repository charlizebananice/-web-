<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
    <head>
        <title>管理员登录</title>
        <%--引入bootstrap--%>
        <script src="<c:url value="/webjars/jquery/3.5.1/jquery.min.js"/>"></script>
        <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css"/>"/>
        <script src="<c:url value="/webjars/bootstrap/4.6.1/js/bootstrap.min.js"/>"></script>

        <%--引入react--%>
        <script src="<c:url value="/static/react/react.development.js"/>" ></script>
        <script src="<c:url value="/static/react/react-dom.development.js"/>" ></script>
        <script src="<c:url value="/static/react/babel.min.js"/>" ></script>
        <%--
                <link rel="stylesheet" href="/static/bootstrap-4.6.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
        --%>
        <%--
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-p1KAotb3W9ndluCsqePPYnjRm3c6abdnIjo0tQwYUv83VsbsYd43RuofnFAaDo0E" crossorigin="anonymous">
        --%>
    </head>
    <body>
        <%--测试bootstrap--%>
        <div class="alert alert-primary" role="alert">
            A simple primary alert—check it out!
        </div>

        <div id="root"></div>
    </body>
    <script type="text/babel">
        class Message extends React.Component{

            handleDelete=(id)=>{
                if(window.confirm('确认删除吗？（您将永远失去此账号）')){
                    this.props.deleteTodo(id);
                }
            }
            render() {
                const {id,password,admin}=this.props;

                return(
                    <li key={id} style={{backgroundColor:admin?'blue':'grey'}}>
                        <span>id:{id} </span>
                        <span>Password:{password}</span>
                        <button onClick={()=>this.handleDelete(id)} as="a" variant="success">删除账号</button>
                    </li>
                )
            }
        }

        class Login extends React.Component{
            state={user:null,pass:null}

            getUsername=(e)=>{
                this.setState({user:e.target.value})
            }

            getPassword=(e)=>{
                this.setState({pass:e.target.value})
            }

            loginCheck=()=>{
                this.props.loginCheck({id:this.state.user,password:this.state.pass})
            }

            render(){
                return (
                    <div>
                        账号：<input onChange={this.getUsername} /><br/>
                        密码：<input onChange={this.getPassword} /><br/>
                        <button onClick={this.loginCheck}>登录</button>
                    </div>
                )
            }
        }

        class Account extends React.Component{
            state={msg:true,user:null,pass:null,done:false}

            showMsg=()=>{
                if(this.state.msg){
                    return '关闭';
                }else{
                    return '展开';
                }
            }

            changeMsg=()=>{
                let newmsg=!this.state.msg;
                this.setState({msg:newmsg});
            }

            addUser=()=>{
                const {user,pass,done}=this.state;
                if(this.state.user===null||this.state.pass===null){
                    alert('无效的用户名或密码')
                }else{
                    this.props.addUser({id:user,password:pass,isadmin:done})
                }
            }

            getUsername=(e)=>{
                this.setState({user:e.target.value})
            }

            getPassword=(e)=>{
                this.setState({pass:e.target.value})
            }

            handleCheck=()=>{
                let newdone=!this.state.done;
                this.setState({done:newdone})
            }

            render() {
                const {accounts,deleteTodo}=this.props;
                return (
                    <div>
                        添加用户:<br/>
                        <input defaultValue={'在此键入用户名'} onChange={this.getUsername} /><br/>
                        <input defaultValue={'在此键入密码'} onChange={this.getPassword} /><br/>
                        创建一个管理员账号？<input type="checkbox" checked={this.state.done} onChange={this.handleCheck}/><br/>
                        <button onClick={()=>this.addUser()}>添加用户</button>
                        <button onClick={this.changeMsg}>{this.showMsg()}用户列表</button><br/>
                        <ul className='account' style={{display:this.state.msg?'block':'none'}}>
                            {
                                accounts.map((accounts)=>{
                                    return <Message {...accounts} deleteTodo={deleteTodo}/>
                                })
                            }
                        </ul>
                    </div>
                )
            }
        }

        class Release extends React.Component{
            state={fee:0,shippingaddr:null,receiveaddr:null}
            getFee=(e)=>{
                const reg=/^\d*?$/;
                if(!reg.test(e.target.value)){
                    alert('警告，配送费用必须为一个数！')
                }else{
                    this.setState({fee:e.target.value})
                }
            }

            getsh=(e)=>{
                this.setState({shippingaddr:e.target.value})
            }

            getre=(e)=>{
                this.setState({receiveaddr:e.target.value})
            }

            submitInformation=()=>{
                let inforObj={fee:this.state.fee,shippingaddress:this.state.shippingaddr,receiveaddress:this.state.receiveaddr,id:this.props.nowid}
                this.props.releaseDeliveryInformation(inforObj);
            }

            render(){
                return (
                    <div>
                        <button onClick={this.submitInformation}>发布配送信息</button><br/>
                        配送费用：<input onChange={this.getFee} /><br/>
                        发货地址：<input onChange={this.getsh} /><br/>
                        收货地址：<input onChange={this.getre} /><br/>
                    </div>
                )
            }
        }

        class Tracking extends React.Component{

            render(){
                return (
                    <div>
                        <hr></hr>
                        跟踪配送信息
                        <input />
                        <button>检索</button>
                    </div>
                )
            }
        }

        class App extends React.Component{
            state={accounts:[
                    {id:'admin',password:'123',admin:true},
                    {id:'admin1',password:'456',admin:false},
                    {id:'admin2',password:'789',admin:false}
                ],nowid:null,login:false}

            deleteTodo=(id)=>{
                const {accounts}=this.state
                const newaccounts=accounts.filter((account)=>{
                    return account.id!==id;
                })
                this.setState({accounts:newaccounts});
            }

            addUser=(accountObj)=>{
                let accept=true;
                const {accounts}=this.state;
                for(let i=0;i<accounts.length;i++){
                    if(accounts[i].id===accountObj.id){
                        alert('用户名已存在');
                        accept=false;
                        break;
                    }
                }
                if(accept){
                    let newaccounts=[accountObj,...accounts];
                    this.setState({accounts:newaccounts})
                }
            }

            releaseDeliveryInformation=(inforObj)=>{
                //发布配送信息
            }

            changeLogin=()=>{
                const {login}=this.state;
                let newlogin=!login;
                this.setState({login:newlogin})
            }

            loginCheck=(userObj)=>{
                let flag=false;
                this.state.accounts.map((user)=>{
                    if(userObj.id===user.id&&userObj.password===user.password){
                        this.changeLogin();
                        flag=true;
                        alert('登录成功')
                    }
                })
                if(!flag){
                    alert('用户名或密码错误');
                }
            }

            render(){
                const {accounts}=this.state;
                return (
                    <div className="App">
                        <div style={{display:this.state.login?'none':'block'}} >
                            <Login loginCheck={this.loginCheck} />
                        </div>
                        <div style={{display:this.state.login?'block':'none'}}>
                            <Account accounts={accounts} deleteTodo={this.deleteTodo} addUser={this.addUser} />
                            <Release releaseDeliveryInformation={this.releaseDeliveryInformation} nowid={this.state.nowid} />
                            <Tracking />
                        </div>
                    </div>
                )
            }
        }
        ReactDOM.render(<App/>,document.getElementById('root'))
    </script>
</html>
