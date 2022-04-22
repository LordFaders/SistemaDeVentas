package com.desafiolatam.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafiolatam.models.Usuario;
import com.desafiolatam.repositories.UsuarioRepository;

@Service
public class UsuarioService {//clase para la lógica de negocio (exFacade)
	
	@Autowired
	UsuarioRepository usuarioRepository;

	public Boolean save(Usuario usuario) {
		//validar que existe o no el usuario para que no se repita
		Usuario existeUsuario = usuarioRepository.findByEmail(usuario.getEmail());
		if(existeUsuario == null) {
			usuarioRepository.save(usuario);
			return true;
		}
		return false;
	}

	public boolean validarUsuario(String emailUsuario, String passwordUsuario) {
		
		Usuario usuario = usuarioRepository.findByEmail(emailUsuario);
		
		if(usuario != null) {//si es distinto de null, existe un usuario con ese email
			if(passwordUsuario.equals(usuario.getPassword())) {
				return true;
			}else {
				return false;//pasword distintas
			}	
		}else {//false porque no existe para ese email
			return false;
		}
	}

	public Usuario findByEmail(String emailUsuario) {	
		return usuarioRepository.findByEmail(emailUsuario);
	}

	public List<Usuario> findAll() {
		
		return usuarioRepository.findAll();
	}

}
