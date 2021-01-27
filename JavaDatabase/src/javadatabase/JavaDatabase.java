
package javadatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Scanner;

public class JavaDatabase {
    private final String url = "jdbc:postgresql://127.0.0.1:5432/PL3";
    private static String user;
    private static String password;
    private final Logger logger = Logger.getLogger(JavaDatabase.class.getName());
    private Connection conn = null;
    static Scanner entrada= new Scanner(System.in);
    public Connection connect() { 
        try {
            Class.forName("org.postgresql.Driver").newInstance(); 
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Conectado!!");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            System.out.println("Driver no detectado");
        } 
        return conn;
    }
    
    public void disconnect(){
        try {
            conn.close();
            System.out.println("Desconectado!!");
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "No se ha podido cerrar la conexión",ex);
        } catch (Exception ex){
            logger.log(Level.WARNING, "Excepción capturada",ex);
        }
    }

    public void Query1(){
        try{
          String query = "select nombre from cliente where codigo_cliente not in (select codigo_cliente from casting);";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
          
          System.out.println("Listado de Clientes que no han contratado ningun Casting ");
          while(rs.next()){
              System.out.println("Cliente: "+rs.getString("nombre").trim()+".");
          }
          System.out.println("============================");
          
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query2(){
        try{
          String query = "select nombre from candidatos where codigo_candidato not in (select codigo_candidato from candidato_realiza_prueba where resultado_prueba = false);";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);

          System.out.println("Listado de Candidatos que han superado todas las pruebas");
          while(rs.next()){
              System.out.println("Nombre de Candidato: "+rs.getString("nombre").trim()+".");
          }
          System.out.println("============================");        
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query3(){
        try{
          String query = "select codigo_de_perfil, count(codigo_de_perfil) as num_candidatos from candidatos group by codigo_de_perfil;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);

          System.out.println("Número de candidatos asociados a cada perfil");
          while(rs.next()){
              System.out.println("Codigo de perfil: "+rs.getString("codigo_de_perfil").trim()+", Numero de Candidatos: "+rs.getString("num_candidatos").trim()+".");              
           
          }
          System.out.println("============================");        


        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query4(){
        try{
          String query = "select nombre from agente where dni in (select dni from presencial group by dni having count(dni) = (select max(num_dni) from (select dni, count(dni) as num_dni from presencial group by dni) as cuantosdni));";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
         
          System.out.println("Nombre del empleado que más castings ha dirigido");
          while(rs.next()){
              System.out.println("Nombre Empleado: "+rs.getString("nombre").trim()+".");
          }
          System.out.println("============================");        
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }

    public void Query5(){
        try{
          String query = "select casting.codigo_casting as casting_cod, count(distinct codigo_candidato) as num_cod_candidato from casting inner join candidato_realiza_prueba on casting.codigo_casting = candidato_realiza_prueba.codigo_casting group by casting.codigo_casting;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de castings con el número de candidatos que se han presentado");
          while(rs.next()){
              System.out.println("Codigo Casting:"+rs.getString("casting_cod").trim()+", Numero de Candidatos: "+rs.getString("num_cod_candidato").trim()+".");
          }
          System.out.println("============================");        
       
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query6(){
        try{
          String query = "select nombre , direccion from candidatos where codigo_de_perfil in (select codigo_de_perfil from perfil where color_del_pelo ='Rubio' and provincia = 'Madrid');";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de candidatas con el pelo rubio y sean de Madrid");
          while(rs.next()){
              System.out.println("Nombre de Candidatas: "+rs.getString("nombre").trim()+", Dirección: "+rs.getString("direccion").trim()+".");
          }
          System.out.println("============================");        

        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query7(){
        try{
          String query = "select codigo_de_perfil from casting_necesita_perfil where codigo_casting in (select codigo_casting from casting where descripcion like '%anuncio tv%');";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de perfiles requeridos para castings con anuncio tv en su descripción.");
          while(rs.next()){
              System.out.println("Codigo de Perfil: "+rs.getString("codigo_de_perfil").trim()+".");
          }
          System.out.println("============================");        
      
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query8(){
        try{
          String query = "select codigo_candidato from candidatos where codigo_de_perfil in (select codigo_de_perfil from perfil where color_del_pelo ='Castaño') and nif_representante != 'null';";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de perfiles con representante y tienen el pelo castaño");
          while(rs.next()){
              System.out.println("Codigo Candidato: "+rs.getString("codigo_candidato").trim()+".");
          }
          System.out.println("============================");         
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query9(){
        try{
          String query = "select codigo_candidato, sum(coste) as dinero_a_pagar from candidato_realiza_prueba inner join prueba_individual on prueba_individual.numero = candidato_realiza_prueba.numero and prueba_individual.codigo_fase = candidato_realiza_prueba.codigo_fase and prueba_individual.codigo_casting = candidato_realiza_prueba.codigo_casting group by codigo_candidato;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado con los precios que han de pagar cada candidato");
          while(rs.next()){
              System.out.println("Codigo Candidato: "+rs.getString("codigo_candidato").trim()+", Dinero a Pagar: "+rs.getString("dinero_a_pagar").trim()+"€ .");

          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }

    public void Query10(){
        try{
          String query = "select count(*) as adultos,(select count(*) from niño) as niño from adultos;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado con el numero de candidatos adultos y de candidatos niños");
          while(rs.next()){
              System.out.println("Nº de Adultos: "+rs.getString("adultos").trim()+".");
              System.out.println("Nº de Niños: "+rs.getString("niño").trim()+".");

          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query11(){
        try{
          String query = "select dni from presencial where codigo_casting in (select codigo_casting from prueba_individual where sala_de_celebracion = 'Sala flor');";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("DNI del agente que ha dirigido alguna prueba individual en la sala flor");
          while(rs.next()){
              System.out.println("DNI de Agente: "+rs.getString("dni").trim()+".");
          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query12(){
        try{
          String query = "select plataforma_web , cliente.nombre as cliente_nombre from casting inner join cliente on casting.codigo_cliente = cliente.codigo_cliente inner join online on casting.codigo_casting = online.codigo_casting where coste = (select max(mayor_coste) from (select coste as mayor_coste from casting) as costes);";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Plataforma web y cliente utilizado en el casting online más caro");
          while(rs.next()){
              System.out.println("Plataforma Web: "+rs.getString("plataforma_web").trim()+".");
              System.out.println("Nombre Cliente: "+rs.getString("cliente_nombre").trim()+".");

          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query13(){
        try{
          String query = "select actividad, count(actividad)*100/(select count(*) from cliente) as porcentaje from cliente group by actividad;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Porcentaje de tipo de clientes");
          while(rs.next()){
              System.out.println("["+rs.getString(1).trim()+"]: "+rs.getString("porcentaje").trim()+"%.");
          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query14(){
        try{
          String query = "select distinct candidatos.nombre as candidato_nombre, casting.nombre as casting_nombre from candidato_realiza_prueba inner join candidatos on candidato_realiza_prueba.codigo_candidato = candidatos.codigo_candidato inner join casting on candidato_realiza_prueba.codigo_casting = casting.codigo_casting where resultado_prueba = true ;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de candidatos que han superado alguna prueba junto con el nombre de su respectivo casting");
          while(rs.next()){
              System.out.println("Nombre Candidato: "+rs.getString("candidato_nombre").trim()+", Casting: "+rs.getString("casting_nombre").trim()+".");

          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }

    public void Query15(){
        try{
          String query = "select sum(coste) as suma_coste from casting;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Dinero total recaudado por la empresa");
          while(rs.next()){
              System.out.println(rs.getString("suma_coste").trim()+"€.");
          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }

    public void Query16(){
        try{
          String query = "select nombre , telefono from representante where nif in (select nif_representante from candidatos group by nif_representante having count(nif_representante)>=2);";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de representantes que representan a 2 o más personas");
          while(rs.next()){
              System.out.println("Nombre representante: "+rs.getString("nombre").trim()+", Telefono: "+rs.getString("telefono").trim()+".");
          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query17(){
        try{
          String query = "select dni from candidatos inner join adultos on candidatos.codigo_candidato = adultos.codigo_candidato where nif_representante is null;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de DNI de adultos sin representante");
          while(rs.next()){
              System.out.println("DNI: "+rs.getString("dni").trim()+".");
          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query18(){
        try{
          String query = "select cliente.nombre as nombre_cliente, perfil.* as datos_perfil from casting_necesita_perfil inner join casting on casting_necesita_perfil.codigo_casting = casting.codigo_casting inner join perfil on casting_necesita_perfil.codigo_de_perfil = perfil.codigo_de_perfil inner join cliente on casting.codigo_cliente = cliente.codigo_cliente where perfil.codigo_de_perfil in (select codigo_de_perfil from casting_necesita_perfil group by codigo_de_perfil having count(codigo_de_perfil) = (select max(veces_solicitado) from (select codigo_de_perfil, count(codigo_de_perfil) as veces_solicitado from casting_necesita_perfil group by codigo_de_perfil) as cuantosperfil));";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de perfiles más demandados junto a sus respectivos clientes");
          while(rs.next()){
              System.out.println("Nombre Cliente: "+rs.getString("nombre_cliente").trim()+", Codigo Perfil: "+rs.getString(2).trim()+", Provincia: "+rs.getString(3).trim()+
                      ", Sexo: "+rs.getString(4).trim()+", Altura: "+rs.getString(5).trim()+", Edad: "+rs.getString(6).trim()+", Color de Pelo: "+rs.getString(7).trim()+
                      ", Color de ojos: "+rs.getString(8).trim()+", Especialidad: "+rs.getString(9).trim()+", Experiencia: "+rs.getString(10).trim()+",");

          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query19(){
        try{
          String query = "select count(*) as pruebas_superadas, niño.codigo_candidato as niño_codigo from candidato_realiza_prueba inner join candidatos on candidato_realiza_prueba.codigo_candidato = candidatos.codigo_candidato inner join niño on niño.codigo_candidato = candidatos.codigo_candidato where resultado_prueba = 'true' group by niño.codigo_candidato;";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de pruebas superadas por cada niño");
          while(rs.next()){
              System.out.println("Pruebas superadas: "+rs.getString("pruebas_superadas").trim()+", Codigo Ñino: "+rs.getString("niño_codigo").trim()+".");

          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }
    
    public void Query20(){
        try{
          String query = "select codigo_casting from fase group by codigo_casting having count(codigo_casting) = (select max(nfases) from (select codigo_casting, count(codigo_casting) as nfases from fase group by codigo_casting) as cuantasfases);";
          Statement stmnt = conn.createStatement();
          ResultSet rs = stmnt.executeQuery(query);
        
          System.out.println("Listado de Castings con más fases");
          while(rs.next()){
              System.out.println("Codigo Casting: "+rs.getString("codigo_casting").trim()+".");
          }
          System.out.println("============================");        
          
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            logger.log(Level.WARNING , "SQL Exception", ex);
        }
    }

    public static void main(String[] args) {
      
        //Primero recogemos los datos para conectarnos a la BD
        System.out.println("Inserte el usuario con el que se quiere conectar:");
        user = entrada.nextLine();
        System.out.println("Inserte la contraseña:");
        password = entrada.nextLine();
        System.out.println("=====================================");
        System.out.println("Conectandose a la base de datos PL3");
        System.out.println("=====================================");
        
        //Nos conectamos a la BD
        JavaDatabase app = new JavaDatabase();
        app.connect();
        //Dejamos elegir al usuario la función a utilizar
        int  opcion = 1;
        System.out.println("1º- Mostrar el nombre de los clientes que no han contratado ningún casting.");
        System.out.println("2º- Mostrar el nombre de los candidatos que han superado todas las pruebas");
        System.out.println("3º- Mostrar el número de candidatos que hay asociados a cada perfil.");
        System.out.println("4º- Mostrar el nombre del empleado que más castings ha dirigido.");
        System.out.println("5º- Mostrar el número de candidatos que se han presentado a cada casting");
        System.out.println("6º- Mostrar el nombre y la dirección de las candidatas que tengan el pelo rubio y sean de Madrid");
        System.out.println("7º- Mostrar el código de perfil de los perfiles requeridos en los castings que incluyen la subcadena “anuncio tv” en su descripción.");
        System.out.println("8º- Mostrar el código de los candidatos que tienen representante y tienen el pelo castaño.");
        System.out.println("9º- Mostrar el precio total que ha de pagar cada candidato");
        System.out.println("10º- Mostrar el número de candidatos adultos y el número de candidatos niños que hay en la base de datos");
        System.out.println("11º- Mostrar el dni del agente que ha dirigido el casting en el que alguna prueba individual se ha llevado a cabo en la sala “flor”");
        System.out.println("12º- Mostrar la plataforma web que se ha usado en el casting online más caro, así como el nombre del cliente que ha contratado dicho casting.");
        System.out.println("13º- Mostrar el porcentaje de clientes que hay de cada tipo");
        System.out.println("14º- Mostrar el nombre de los candidatos que han superado alguna prueba de algún casting, así como el nombre del casting.");
        System.out.println("15º- Mostrar el dinero total recaudado por la empresa");
        System.out.println("16º- Mostrar el nombre y el teléfono de los representantes que representen a 2 candidatos como mínimo.");
        System.out.println("17º- Mostrar el dni de los adultos que no tengan representante");
        System.out.println("18º- Mostrar los datos del perfil más demandado así como el nombre del cliente que lo ha requerido para su casting.");
        System.out.println("19º- Mostrar el número de pruebas superadas por cada niño.");
        System.out.println("20º- Mostrar el código del casting que más fases tiene.");
        System.out.println("21º- Salir del Programa");        
        while(opcion != 21){
            System.out.println("Introduzca del listado anterior la query que quiere realizar:");
            opcion = entrada.nextInt();
            
            switch(opcion){
                case(1): app.Query1();
                    break;
                case(2): app.Query2();
                    break;
                case(3): app.Query3();
                    break;
                case(4): app.Query4();
                    break;            
                case(5): app.Query5();
                    break;            
                case(6): app.Query6();
                    break;            
                case(7): app.Query7();
                    break;            
                case(8): app.Query8();
                    break;            
                case(9): app.Query9();
                    break;            
                case(10): app.Query10();
                    break;            
                case(11): app.Query11();
                    break;
                case(12): app.Query12();
                    break;
                case(13): app.Query13();
                    break;
                case(14): app.Query14();
                    break;            
                case(15): app.Query15();
                    break;            
                case(16): app.Query16();
                    break;            
                case(17): app.Query17();
                    break;            
                case(18): app.Query18();
                    break;            
                case(19): app.Query19();
                    break;            
                case(20): app.Query20();
                    break;
                case(21): 
                    System.out.println("Desconectandonos de la base de datos.");          
            }       
        }
        app.disconnect();
    }
    
}
