
package Controladores;

import Modelos.Usuario;
import Modelos.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Validar extends HttpServlet {


    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("Ingresar")) {
            int documento = Integer.parseInt(request.getParameter("txtusuario"));
            String pass = request.getParameter("txtpassword");
            usuario = usuarioDAO.Validar(documento, pass);
            
            if(usuario.getNombre()!= null){
                
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("Controlador?menu=Principal").forward(request, response);
                

            }else{
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            

        }else{
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
