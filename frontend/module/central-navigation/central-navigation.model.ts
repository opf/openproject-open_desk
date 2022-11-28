export interface ILinkedApplication {
  identifier:string;
  name:string;
  icon:string;
  link:string;
}

export interface IApplicationGroup {
  identifier:string;
  name:string;
  items:ILinkedApplication[];
}
