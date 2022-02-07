package servlets.funcion.agregar;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Pelicula;
import logic.LogicPelicula;

/**
 * Servlet implementation class MostrarPelicula
 */
@WebServlet("/BuscarPeliculasAgregar")
public class BuscarPeliculasAgregar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarPeliculasAgregar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LogicPelicula lp = new LogicPelicula();
		
		LinkedList<Pelicula>peliculas= lp.getAll();
		
		request.setAttribute("peliculas", peliculas);
		
		Integer codigoPel = Integer.parseInt(request.getParameter("elegirpelicula"));

		Pelicula peli = lp.buscarPorCodigo(codigoPel);
		
		request.setAttribute("peliculaEncontrada", peli);
		
		if ( peli.getNombre()!=null) {
			request.setAttribute("encontrada", "encontrada");
		}
		else {
			request.setAttribute("Noencontrada", "Noencontrada");
		}
		
		request.getRequestDispatcher("WEB-INF/Funcion/Agregar/AgregarFuncion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}