import express from 'express'
import ClienteController from './../controllers/cliente.controller'

const router = express.Router()

router.get('/', ClienteController.getAll)

export default router