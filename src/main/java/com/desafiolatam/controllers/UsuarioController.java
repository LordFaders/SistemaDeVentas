package com.desafiolatam.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.desafiolatam.models.Direccion;
import com.desafiolatam.models.Usuario;
import com.desafiolatam.services.DireccionService;
import com.desafiolatam.services.UsuarioService;

@Controller
public class UsuarioController {

	// inyección de dependencias para acceder a los métodos
	@Autowired
	UsuarioService usuarioService;
	
	@Autowired
	DireccionService direccionService;

	// ruta
	@RequestMapping("/") // https://localhost:9080/
	// metodo
	public String showLogin() {
		return "login.jsp";// llamado al jsp
	}

	@PostMapping("/login")
	public String loguear(@RequestParam(value = "email") String emailUsuario,
			@RequestParam(value = "password") String passwordUsuario, Model model, HttpSession session,
			RedirectAttributes redirectAttributes) {

		System.out.println("email" + emailUsuario + "password" + emailUsuario);

		// validar
		if (emailUsuario != null && !emailUsuario.equals("") && passwordUsuario != null
				&& !passwordUsuario.equals("")) {
			// Ok msgOK redirect
		

			//persistencia

			boolean resultado = usuarioService.validarUsuario(emailUsuario, passwordUsuario);

			if (resultado) {
				// Session, agregamos un atributo
				session.setAttribute("emailUsuario", emailUsuario);

				// Pasar parametro a otra ruta de controller
				redirectAttributes.addFlashAttribute("msgOK", "Bienvenido");
				return "redirect:/home";
			} else {
				model.addAttribute("msgError", "Error de ingreso, por favor reintente");
				return "login.jsp";
			}
		} else {
			// retornar mensaje de error
			model.addAttribute("msgError", "Datos faltantes, por favor reintente");

			return "login.jsp";
		}
	}

	// muestra el jsp
	@RequestMapping("/registro") // https://localhost:9080/regsitro
	public String showRegistro(@ModelAttribute("usuario") Usuario usuario) {

		/*
		 * public String showRegistro(Model model) { // Otra forma de pasar un objeto
		 * vacío model.addAttribute("usuario", new Usuario());
		 */

		return "/usuario/registro.jsp";// llamado al jsp
	}


	// capturar los datos del jsp (Nueva forma)
	@PostMapping("/registro2")
	public String capturaRegistro2(@ModelAttribute("usuario") Usuario usuario, Model model,
			RedirectAttributes redirectAttributes // pasar parámetros a otra ruta de controller u otra url
	) {// capturar

		// imprimir

		// validar distintos de null y vacío
		if (usuario.getNombre() != null && !usuario.getNombre().equals("") && usuario.getEmail() != null
				&& !usuario.getEmail().equals("") && usuario.getPassword() != null && !usuario.getPassword().equals("")
				&& usuario.getPassword2() != null && !usuario.getPassword2().equals("")) {

			System.out.println(usuario);
			System.out.println(
					"nombre" + usuario.getNombre() + "email" + usuario.getEmail() + "password" + usuario.getPassword());
			// TODO persistencia
			Boolean usuariosCreado = usuarioService.save(usuario);
			if(usuariosCreado) {
				// Pasar parametro a otra ruta de controller
			redirectAttributes.addFlashAttribute("msgOK", "Usuario creado correctamente.");

			// redireccionamineto al login
			return "redirect:/";
			}else {
				// retornar mensaje de error
				model.addAttribute("msgError", "Error al crear usuario.");

				return "registro.jsp";
			}
			
		} else {
			// retornar mensaje de error
			model.addAttribute("msgError", "Datos faltantes, por favor reintente");

			return "registro.jsp";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();// matar la session
		return "redirect:/";
	}
	
	@RequestMapping("/usuarioDireccion")
	public String usuarioDireccion(@ModelAttribute("usuario") Usuario usuario, Model model) {
		
		model.addAttribute("listaUsuarios", usuarioService.findAll());
		model.addAttribute("listaDirecciones", direccionService.findAll());
		
		return "usuario/usuarioDireccion.jsp";
	}
	
	
}
