package com.desafiolatam.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.desafiolatam.models.Usuario;
import com.desafiolatam.services.UsuarioService;

@Controller
public class HomeController {

	@Autowired
	UsuarioService usuarioService;

	@RequestMapping("/index")
	public String home2() {
		return "/index.jsp";// llamado al jsp u otra ruta
	}

	@RequestMapping("/home")
	public String home(Model model,HttpSession session) {
		//Session, capturamos el atributo
		
		if(session.getAttribute("emailUsuario") != null) {
			String emailUsuario = (String)session.getAttribute("emailUsuario");
			
			Usuario usuario = usuarioService.findByEmail(emailUsuario);
			model.addAttribute("nombreUsuario", usuario.getNombre());
			return "/home.jsp";
		}else {
			return "redirect:/";
		}
		
		// llamado al jsp u otra ruta
	}

	


	
}
