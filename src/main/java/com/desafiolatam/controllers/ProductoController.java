package com.desafiolatam.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.desafiolatam.models.Producto;
import com.desafiolatam.services.ProductoService;

@Controller
@RequestMapping("/producto")
public class ProductoController {

	@Autowired
	ProductoService productoService;
	
	//despliega jsp
	@RequestMapping("")
	public String showProducto(@ModelAttribute("producto")Producto producto) {
		return "/producto/crearProducto.jsp";
	}
	
	//capturar el objeto producto
	@PostMapping("")
	public String guardarProducto(@Valid @ModelAttribute("producto")Producto producto) {
		
		//validar campos
		
		productoService.save(producto);
		
		return "/producto/crearProducto.jsp";
	}
}
