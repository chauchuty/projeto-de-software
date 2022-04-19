import { Request, Response } from "express";
import conn from "./../conn";

class ClienteController {
  static getAll(req: Request, res: Response) {
    conn.query("SELECT * FROM cliente", (err, results) => {
      if (err) return res.status(500).send(err);
      res.json(results);
    });
  }
}

export default ClienteController;
