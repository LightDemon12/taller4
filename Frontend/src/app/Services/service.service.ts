import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ServiceService {
  
  url = "";

  constructor(private http: HttpClient) { 
    this.url = "http://localhost:4000";
  }

  SLogin(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/Login', objeto);
  }
  SActualizarPass(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/ForgotPassword', objeto);
  }
  SRegistrar(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/addUser', objeto);
  }

  getPublicaciones(): Observable<any[]> {
    return this.http.get<any>(this.url + '/Grupo3/listpublications');
  }

  getCatedraticos(): Observable<any[]> {
    return this.http.get<any>(this.url + '/Grupo3/Listcate');
  }

  getCursos(): Observable<any[]> {
    return this.http.get<any>(this.url + '/Grupo3/Listcourses');
  }

  SRegistrarPubli(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/addpublication', objeto);
  }
  Seditar(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/updateUser', objeto);
  }
  
  
  SAsignar(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/addCurso', objeto);
  }

  SMycourse(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/MyCourses', objeto);
  }

  STotalCreditos(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/TotalCreditos', objeto);
  }

  getUsers(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/ListUser', objeto);
  }
  SComentario(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/addcomment', objeto);
  }
  SListaComentario(objeto: any): Observable<any[]> {
    return this.http.post<any>(this.url + '/Grupo3/listcomment', objeto);
  }
}
