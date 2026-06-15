class Grupo{
  const property miembros=[]
  const property nombre
  var cantPeleas

  method agregarMiembro(nuevoMiembro){miembros.add(nuevoMiembro)}
  method quitarMiembro(nuevoMiembro){miembros.remove(nuevoMiembro)}
  
  method puedenCombatir() = miembros.filter({m=>m.vida() > 0})
  method campeon() = self.puedenCombatir().max({m=>m.poderDeAtaque()})

  method combatirCon(unGrupo){
    self.campeon().pelearCon(unGrupo.campeon())
    self.campeon().pelearCon(unGrupo.campeon())
    self.campeon().pelearCon(unGrupo.campeon())
    cantPeleas+=3
  }

}

object coliseo{
  method organizarCombate(unGrupo,otroGrupo){
    unGrupo.combatirCon(otroGrupo)
  }

  method organizarCombateContraGladiador(unGrupo,unGladiador){
    unGrupo.forEach({g=>g.pelearCon(unGladiador)})
  }

  method curar(unGladiador){
    unGladiador.curar()
  }

  method curarGrupo(unGrupo){
    unGrupo.miembros().forEach({g=>g.curar()})
  }
}