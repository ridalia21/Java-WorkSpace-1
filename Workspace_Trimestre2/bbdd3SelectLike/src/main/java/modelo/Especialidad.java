package modelo;

public class Especialidad {

	private int id;
	private String nombre;
	private int horas;
	private String nivel;

	public Especialidad(int id, String nombre, int horas, String nivel) {
		this.id = id;
		this.nombre = nombre;
		this.horas = horas;
		this.nivel = nivel;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getHoras() {
		return horas;
	}

	public void setHoras(int horas) {
		this.horas = horas;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}

	@Override
	public String toString() {
		return "Especialidad [id=" + id + ", nombre=" + nombre + ", horas=" + horas + ", nivel=" + nivel + "]";
	}

}
