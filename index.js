const express = require('express')
const mysql = require('mysql2/promise')

const conn = mysql.createPool({ 
    host:"localhost",
    user:"root",
    password:"",
    database:"software_escolar"    
})

const app = express();
app.use(express.json())

app.listen(3000);

app.get("/",(req,res) => {
    res.json({
        rotas: {
            "/": "GET ",
            "/login": "POST"
        }
    })
})

app.post("/login", async (req,res) =>{
    let auth = false
    const {usuario,senha} = req.body
    const clienteIP = req.ip
    
    const sql = "SELECT * FROM usuarios WHERE usuario = ? and senha = ? LIMIT 1;"

    try {
        const [rows] = await conn.query(sql, [usuario, senha])
    
        if(rows.length > 0){ 
            auth = true
        }

        const log = "insert into log_login (usuario, ip, sql_executado, parametros, resultado) values (?,?,?,?,?);"

        const parametros = JSON.stringify({usuario,senha})
        const resultado = auth ? `sucesso` : `falha`

        await conn.query(log, [usuario, clienteIP, sql, parametros, resultado])

        res.json({
            isAuth: auth 
        })
        } catch (error) {
            console.error(error)
            res.status(500).json({ erro: "Erro no servidor"})
        }
})   