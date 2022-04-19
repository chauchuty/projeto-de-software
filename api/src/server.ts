import express from "express";
import clientes from "./routes/clientes.route";
import servicos from "./routes/servicos.route";

// Settings
const app = express();
app.use(express.json());

// Routes
app.use('/clientes', clientes);
app.use('/servicos', servicos);

app.listen(3001, () => "server running on port 3001");
