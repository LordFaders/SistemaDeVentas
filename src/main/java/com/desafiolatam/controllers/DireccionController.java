package com.desafiolatam.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.desafiolatam.models.Direccion;
import com.desafiolatam.services.DireccionService;
import com.desafiolatam.services.UsuarioService;

@Controller
@RequestMapping("/direccion")
public class DireccionController {
	//un usuario una direccion
	@Autowired
	DireccionService direccionService;
	
	@Autowired
	UsuarioService usuarioService;
	
	//despliegue
	@RequestMapping("/usuario")
	public String mostrarDireccion(@ModelAttribute("direccion") Direccion direccion, Model model){
		
		model.addAttribute("listaUsuarios", usuarioService.findAll());
		
		return "direccion.jsp";
	}
	
	@PostMapping("/agregar/usuario")
	public String capturaDireccion(@Valid @ModelAttribute("direccion") Direccion direccion,
			BindingResult resultado, Model model) {
		if(!resultado.hasErrors()) {//no existe error
			
			//validar si seleccionó o no un usuario
			
			direccionService.save(direccion);
			return "redirect:/direccion";
		}else {//existe error
			model.addAttribute("listaUsuarios", usuarioService.findAll());
			return "direccion.jsp";
		}
	}
}
