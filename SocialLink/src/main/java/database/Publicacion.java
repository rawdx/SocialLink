package database;

import java.sql.Date;

//@Entity
//@Table(name = "publicaciones")
public class Publicacion {

//  @Id
//  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String titulo;

  private String contenido;

//  @Temporal(TemporalType.TIMESTAMP)
//  @Column(name = "fecha_creacion")
  private Date fechaCreacion;

//  @ManyToOne(fetch = FetchType.LAZY)
//  @JoinColumn(name = "usuario_id", nullable = false)
 // private Usuario usuario;

  // Constructor, getters y setters

}