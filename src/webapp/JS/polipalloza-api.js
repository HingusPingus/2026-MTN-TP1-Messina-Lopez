// js/polipalloza-api.js - SISTEMA COMPLETO CON INICIALIZACIÓN AUTOMÁTICA
class PolipallozaAPI {
    static config = {
        baseUrl: 'http://localhost:8080/api'
    };

    // ========== INICIALIZACIÓN CON BACKEND ==========
    static async inicializarSistema() {
        try {
            console.log('Inicializando sistema Polipalloza con datos reales...');
            
            // Cargar usuario desde la base de datos
            const usuario = await this.cargarUsuarioDesdeBackend();
            if (usuario) {
                localStorage.setItem('usuario', JSON.stringify(usuario));
                console.log('Usuario cargado desde BD:', usuario);
            }
            
            // Cargar favoritos desde la base de datos
            await this.cargarFavoritosDesdeBackend();
            
            console.log('Sistema inicializado correctamente con datos reales');
        } catch (error) {
            console.error('Error inicializando sistema:', error);
            await this.inicializarDatosDemo();
        }
    }

    static async cargarUsuarioDesdeBackend() {
        try {
            console.log('Cargando usuario real desde backend...');
            const response = await fetch(`${this.config.baseUrl}/clientes/demo`);
            
            if (response.ok) {
                const usuarioData = await response.json();
                return usuarioData;
            } else {
                throw new Error(`Error HTTP: ${response.status}`);
            }
        } catch (error) {
            console.error('Error cargando usuario:', error);
            throw error;
        }
    }

    static async cargarFavoritosDesdeBackend() {
    try {
        const usuario = JSON.parse(localStorage.getItem('usuario'));
        if (!usuario || !usuario.usuario) {
            console.log('⚠️ No hay usuario logueado, no se pueden cargar favoritos');
            localStorage.setItem('favoritos', JSON.stringify([]));
            return;
        }

        console.log('🔄 Cargando favoritos para DNI:', usuario.usuario.dni);
        
        const response = await fetch(`${this.config.baseUrl}/clientes/${usuario.usuario.dni}/favoritos`);
        
        console.log('📥 Favoritos response status:', response.status);
        
        if (response.ok) {
            const favoritosData = await response.json();
            console.log('📊 Favoritos recibidos:', favoritosData);
            
            // Extraer solo los IDs de los artistas favoritos
            const favoritosIds = favoritosData.map(fav => fav.id);
            localStorage.setItem('favoritos', JSON.stringify(favoritosIds));
            localStorage.setItem('favoritosCompletos', JSON.stringify(favoritosData));
            
            console.log(`✅ Favoritos cargados: ${favoritosIds.length} artistas - IDs:`, favoritosIds);
        } else {
            const errorText = await response.text();
            console.error('❌ Error cargando favoritos:', errorText);
            throw new Error(`Error HTTP: ${response.status}`);
        }
    } catch (error) {
        console.error('💥 Error cargando favoritos reales:', error);
        localStorage.setItem('favoritos', JSON.stringify([]));
    }
}
static esFavorito(artistaId) {
    const favoritosGuardados = localStorage.getItem('favoritos');
    const favoritos = favoritosGuardados ? JSON.parse(favoritosGuardados) : [];
    
    console.log(`🔍 Verificando si artista ${artistaId} es favorito...`);
    console.log(`📋 Favoritos actuales:`, favoritos);
    console.log(`✅ Resultado: ${favoritos.includes(artistaId)}`);
    
    return favoritos.includes(artistaId);
}

    static async inicializarDatosDemo() {
        console.log('Usando datos demo...');
        const usuarioDemo = {
            tipo: "cliente",
            usuario: {
                dni: 1001,
                nombre: "Juan",
                apellido: "Pérez",
                mail: "juanperez@mail.com",
                direccion: "Calle Ficticia 123",
                telefono: "12345678"
            }
        };
        localStorage.setItem('usuario', JSON.stringify(usuarioDemo));
        localStorage.setItem('favoritos', JSON.stringify([]));
    }

    // ========== CARGAR ARTISTAS DESDE BACKEND ==========
    static async cargarArtistasDesdeBackend() {
        try {
            console.log('Cargando artistas desde backend...');
            const response = await fetch(`${this.config.baseUrl}/setlists`);
            
            if (response.ok) {
                const setlists = await response.json();
                const artistas = this.mapearSetlistsAArtistas(setlists);
                console.log(`Artistas cargados: ${Object.keys(artistas).length}`);
                return artistas;
            } else {
                throw new Error(`Error HTTP: ${response.status}`);
            }
        } catch (error) {
            console.error('Error cargando artistas:', error);
            return this.obtenerArtistasDemo();
        }
    }

    static mapearSetlistsAArtistas(setlists) {
        const artistas = {};
        setlists.forEach(setlist => {
            if (setlist.artista) {
                const artista = setlist.artista;
                artistas[artista.dni] = {
                    id: artista.dni,
                    nombre: artista.nombreArtistico || `${artista.nombre} ${artista.apellido}`,
                    genero: artista.generoMusical,
                    destacado: artista.destacado,
                    imagen: this.obtenerImagenArtista(artista.nombreArtistico),
                    dia: `Día ${setlist.dia}`,
                    escenario: setlist.escenario ? setlist.escenario.nombre : 'Escenario Principal',
                    horario: `${setlist.horaInicio} a ${setlist.horaFin}`,
                    setlistId: setlist.id
                };
            }
        });
        return artistas;
    }

    static obtenerImagenArtista(nombreArtistico) {
        const imagenes = {
            'Arctic Monkeys': '../Imagenes/Gri/artic esce.jpg',
            'Billie Eilish': '../Imagenes/Gri/billie esce.jpg',
            'Duki': '../Imagenes/Gri/duko esce.avif',
            'Milo J': '../Imagenes/Gri/milo esce.webp',
            'Taichu': '../Imagenes/Gri/taichu.webp',
            'Lara91k': '../Imagenes/Gri/lara.avif',
            'Tobi': '../Imagenes/Gri/tobi.jpg'

        };
        return imagenes[nombreArtistico] || '../Imagenes/default-artist.jpg';
    }

    // ========== MÉTODOS DE FAVORITOS ==========
    static obtenerFavoritos() {
        const favoritosGuardados = localStorage.getItem('favoritos');
        return favoritosGuardados ? JSON.parse(favoritosGuardados) : [];
    }

    static obtenerFavoritosCompletos() {
        const favoritosCompletos = localStorage.getItem('favoritosCompletos');
        return favoritosCompletos ? JSON.parse(favoritosCompletos) : [];
    }

    static esFavorito(artistaId) {
        const favoritos = this.obtenerFavoritos();
        return favoritos.includes(artistaId);
    }

    static async agregarFavoritoBackend(setlistId) {
    try {
        const usuario = JSON.parse(localStorage.getItem('usuario'));
        if (!usuario || !usuario.usuario) {
            throw new Error('Usuario no encontrado');
        }

        console.log('📤 Agregando favorito - DNI:', usuario.usuario.dni, 'Setlist:', setlistId);
        
        const response = await fetch(`${this.config.baseUrl}/usuarios/${usuario.usuario.dni}/favoritos`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ idSetlist: setlistId })
        });

        console.log('📥 Response status:', response.status);
        
        if (response.ok) {
            // Recargar favoritos desde el backend
            await this.cargarFavoritosDesdeBackend();
            return true;
        } else {
            const errorText = await response.text();
            console.error('❌ Error backend:', errorText);
            throw new Error(errorText);
        }
    } catch (error) {
        console.error('💥 Error agregando favorito en backend:', error);
        throw error;
    }
}

    static async eliminarFavoritoBackend(setlistId) {
    try {
        const usuario = JSON.parse(localStorage.getItem('usuario'));
        if (!usuario || !usuario.usuario) {
            throw new Error('Usuario no encontrado');
        }

        console.log('📤 Eliminando favorito - DNI:', usuario.usuario.dni, 'Setlist:', setlistId);
        
        const response = await fetch(`${this.config.baseUrl}/usuarios/${usuario.usuario.dni}/rmfavoritos`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ idSetlist: setlistId })
        });

        console.log('📥 Response status:', response.status);
        
        if (response.ok) {
            // Recargar favoritos desde el backend
            await this.cargarFavoritosDesdeBackend();
            return true;
        } else {
            const errorText = await response.text();
            console.error('❌ Error backend:', errorText);
            throw new Error(errorText);
        }
    } catch (error) {
        console.error('💥 Error eliminando favorito en backend:', error);
        throw error;
    }
}

    // ========== GRILLA - CARGA DESDE BACKEND ==========
    // ========== MÉTODOS MEJORADOS PARA GRILLA ==========
static async cargarGrillaCompleta() {
    try {
        console.log('🎵 Cargando grilla completa desde backend...');
        this.mostrarLoading(true);
        
        const artistasData = await this.cargarArtistasDesdeBackend();
        const grillaContainer = document.getElementById('grilla-container');
        
        if (!grillaContainer) {
            console.error('❌ Contenedor de grilla no encontrado');
            return;
        }

        // Ocultar loading
        this.mostrarLoading(false);
        
        let html = '';
        const artistas = Object.values(artistasData);
        
        if (artistas.length === 0) {
            html = `
                <div class="col-12 text-center py-5">
                    <i class="bi bi-music-note-beamed display-1 text-muted"></i>
                    <h4 class="text-muted mt-3">No hay artistas disponibles</h4>
                    <p class="text-muted">No se encontraron artistas en la base de datos.</p>
                </div>
            `;
        } else {
            artistas.forEach(artista => {
                const esFavorito = this.esFavorito(artista.id);
                const botonEstado = esFavorito ? 'bi-check-square-fill' : 'bi-square';
                const textoBoton = esFavorito ? 'En tu grilla' : 'Agregar a tu grilla';
                const claseActiva = esFavorito ? 'active' : '';
                
                html += `
                    <div class="col-md-6 col-lg-4">
                        <div class="artist-card">
                            <div class="card-img-wrapper">
                                <img src="${artista.imagen}" alt="${artista.nombre}" 
                                     onerror="this.src='../Imagenes/default-artist.jpg'"
                                     class="img-fluid">
                            </div>
                            <div class="card-content">
                                <h3 class="artist-name">${artista.nombre}</h3>
                                <ul class="artist-details">
                                    <li><i class="bi bi-calendar-event"></i> ${artista.dia}</li>
                                    <li><i class="bi bi-geo-alt"></i> ${artista.escenario}</li>
                                    <li><i class="bi bi-clock"></i> ${artista.horario}</li>
                                    ${artista.genero ? `<li><i class="bi bi-music-note-list"></i> ${artista.genero}</li>` : ''}
                                </ul>
                                <button class="anotado-btn ${claseActiva}" 
                                        onclick="PolipallozaAPI.toggleFavoritoGrilla(this, ${artista.id}, ${artista.setlistId})"
                                        data-artista-id="${artista.id}"
                                        data-setlist-id="${artista.setlistId}">
                                    ${textoBoton}
                                    <i class="bi ${botonEstado}"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            });
        }

        grillaContainer.innerHTML = html;
        this.actualizarContadorGrilla();
        console.log(`✅ Grilla cargada: ${artistas.length} artistas`);
        
    } catch (error) {
        console.error('❌ Error cargando grilla:', error);
        this.mostrarError('Error al cargar la grilla: ' + error.message);
        this.cargarGrillaDemo();
    }
}

static async toggleFavoritoGrilla(button, artistaId, setlistId) {
    try {
        console.log('🎵 Toggle favorito - Artista ID:', artistaId, 'Setlist ID:', setlistId);
        
        // Deshabilitar botón temporalmente
        button.disabled = true;
        const textoOriginal = button.innerHTML;
        
        const artista = await this.obtenerArtistaPorId(artistaId);
        const esFavorito = this.esFavorito(artistaId);
        
        if (esFavorito) {
            // ELIMINAR de favoritos
            console.log('❌ Eliminando de favoritos...');
            button.innerHTML = `Quitando... <i class="bi bi-hourglass-split"></i>`;
            
            await this.eliminarFavoritoBackend(setlistId);
            
            // Actualizar interfaz
            button.querySelector('i').className = 'bi bi-square';
            button.classList.remove('active');
            button.innerHTML = `Agregar a tu grilla <i class="bi bi-square"></i>`;
            
            this.mostrarMensaje(`❌ ${artista.nombre} removido de favoritos`);
            console.log('✅ Eliminado de favoritos correctamente');
            
        } else {
            // AGREGAR a favoritos
            console.log('✅ Agregando a favoritos...');
            button.innerHTML = `Agregando... <i class="bi bi-hourglass-split"></i>`;
            
            await this.agregarFavoritoBackend(setlistId);
            
            // Actualizar interfaz
            button.querySelector('i').className = 'bi bi-check-square-fill';
            button.classList.add('active');
            button.innerHTML = `En tu grilla <i class="bi bi-check-square-fill"></i>`;
            
            this.mostrarMensaje(`✅ ${artista.nombre} agregado a favoritos`);
            console.log('✅ Agregado a favoritos correctamente');
        }
        
        // Actualizar contador
        this.actualizarContadorGrilla();
        
    } catch (error) {
        console.error('💥 Error en toggle favorito:', error);
        
        // Mostrar mensaje de error más específico
        let mensajeError = 'Error al actualizar favoritos';
        if (error.message.includes('grilla del cliente no existe')) {
            mensajeError = 'Error: No se pudo encontrar tu grilla personal';
        } else if (error.message.includes('Cliente no encontrado')) {
            mensajeError = 'Error: Usuario no encontrado';
        } else if (error.message.includes('Setlist no encontrado')) {
            mensajeError = 'Error: Artista no encontrado';
        }
        
        this.mostrarMensaje(`❌ ${mensajeError}`);
        
        // Restaurar estado original del botón
        const esFavoritoActual = this.esFavorito(artistaId);
        this.actualizarBotonFavorito(button, esFavoritoActual);
    } finally {
        button.disabled = false;
    }
}

// Método auxiliar para actualizar el botón
static actualizarBotonFavorito(button, esFavorito) {
    const botonEstado = esFavorito ? 'bi-check-square-fill' : 'bi-square';
    const textoBoton = esFavorito ? 'En tu grilla' : 'Agregar a tu grilla';
    const claseActiva = esFavorito ? 'active' : '';
    
    button.innerHTML = `${textoBoton} <i class="bi ${botonEstado}"></i>`;
    if (esFavorito) {
        button.classList.add('active');
    } else {
        button.classList.remove('active');
    }
}
// Actualizar el método actualizarContadorGrilla
static actualizarContadorGrilla() {
    const contador = document.getElementById('contador-artistas');
    const favoritos = this.obtenerFavoritos();
    if (contador) {
        contador.textContent = `Tienes ${favoritos.length} artista(s) en tu grilla`;
        contador.className = favoritos.length > 0 ? 'text-success' : '';
    }
}

    

    // ========== MÉTODOS PARA CARGAR DATOS DEL USUARIO ==========
    static async cargarDatosPerfil() {
        try {
            console.log('👤 Cargando datos del perfil...');
            
            const usuario = JSON.parse(localStorage.getItem('usuario'));
            if (!usuario || !usuario.usuario) {
                console.error('❌ No hay usuario en localStorage');
                this.mostrarErrorEnPerfil('No hay usuario logueado');
                return;
            }

            console.log('✅ Usuario encontrado:', usuario.usuario);
            this.actualizarInterfazPerfil(usuario.usuario);

        } catch (error) {
            console.error('❌ Error cargando datos del perfil:', error);
            this.mostrarErrorEnPerfil('Error cargando datos del usuario');
        }
    }

    static actualizarInterfazPerfil(datosUsuario) {
        try {
            console.log('🎨 Actualizando interfaz con:', datosUsuario);
            
            const mapeoCampos = {
                'bienvenida-usuario': `¡Bienvenido, ${datosUsuario.nombre}!`,
                'nombre-usuario': `${datosUsuario.nombre} ${datosUsuario.apellido}`,
                'input-nombre': datosUsuario.nombre,
                'input-apellido': datosUsuario.apellido,
                'input-email': datosUsuario.mail,
                'input-dni': datosUsuario.dni,
                'input-direccion': datosUsuario.direccion || 'No disponible',
                'input-telefono': datosUsuario.telefono || 'No disponible',
                'tipo-usuario': 'Basic Member'
            };

            // Actualizar cada campo
            Object.entries(mapeoCampos).forEach(([id, valor]) => {
                const elemento = document.getElementById(id);
                if (elemento) {
                    if (elemento.tagName === 'INPUT') {
                        elemento.value = valor;
                        console.log(`✅ Campo ${id} actualizado:`, valor);
                    } else {
                        elemento.textContent = valor;
                        console.log(`✅ Texto ${id} actualizado:`, valor);
                    }
                } else {
                    console.warn(`⚠️ Elemento ${id} no encontrado en el DOM`);
                }
            });

            console.log('✅ Interfaz del perfil actualizada correctamente');

        } catch (error) {
            console.error('❌ Error actualizando interfaz:', error);
        }
    }

    static mostrarErrorEnPerfil(mensaje) {
        const nombreElement = document.getElementById('nombre-usuario');
        if (nombreElement) {
            nombreElement.textContent = 'Error cargando datos';
            nombreElement.style.color = 'red';
        }
        console.error('💥 Error en perfil:', mensaje);
    }

    // ========== MÉTODOS PARA ARTISTAS FAVORITOS ==========
    static async cargarArtistasFavoritosDesdeBackend() {
        try {
            const usuario = JSON.parse(localStorage.getItem('usuario'));
            if (!usuario || !usuario.usuario) {
                console.error('No hay usuario logueado');
                throw new Error('Usuario no logueado');
            }

            console.log('Cargando artistas favoritos desde backend para DNI:', usuario.usuario.dni);
            
            const response = await fetch(`${this.config.baseUrl}/favoritos/cliente/${usuario.usuario.dni}`);
            
            if (!response.ok) {
                throw new Error(`Error HTTP: ${response.status} - ${response.statusText}`);
            }
            
            const artistasFavoritos = await response.json();
            console.log(`✅ Artistas favoritos cargados: ${artistasFavoritos.length}`);
            
            return artistasFavoritos;
            
        } catch (error) {
            console.error('❌ Error cargando artistas favoritos:', error);
            throw error;
        }
    }

    static async mostrarArtistasFavoritosEnPerfil() {
        try {
            console.log('🎵 Cargando artistas favoritos para el perfil...');
            
            const container = document.getElementById('artistas-favoritos-container');
            if (!container) {
                console.error('❌ Contenedor de artistas no encontrado');
                return;
            }

            // Mostrar loading
            container.innerHTML = `
                <div class="col-12 text-center py-5">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Cargando artistas favoritos...</span>
                    </div>
                    <p class="text-muted mt-3">Cargando tus artistas favoritos...</p>
                </div>
            `;

            // Cargar desde el backend
            const artistasFavoritos = await this.cargarArtistasFavoritosDesdeBackend();
            console.log('🎵 Artistas cargados:', artistasFavoritos);
            
            this.mostrarArtistasEnInterfaz(artistasFavoritos);
            
        } catch (error) {
            console.error('❌ Error mostrando artistas favoritos:', error);
            this.mostrarErrorArtistas('No se pudieron cargar los artistas favoritos');
        }
    }

    static mostrarArtistasEnInterfaz(artistasFavoritos) {
        const container = document.getElementById('artistas-favoritos-container');
        const sinFavoritos = document.getElementById('sin-favoritos');
        const contadorFavoritos = document.getElementById('contador-favoritos');
        
        console.log(`🎯 Mostrando ${artistasFavoritos.length} artistas en la interfaz`);

        // Actualizar contador
        if (contadorFavoritos) {
            contadorFavoritos.textContent = `${artistasFavoritos.length} artista${artistasFavoritos.length !== 1 ? 's' : ''}`;
        }

        let html = '';
        if (artistasFavoritos.length === 0) {
            console.log('📭 No hay artistas favoritos');
            container.style.display = 'none';
            if (sinFavoritos) sinFavoritos.style.display = 'block';
        } else {
            console.log('🎨 Renderizando artistas...');
            container.style.display = 'flex';
            if (sinFavoritos) sinFavoritos.style.display = 'none';

            artistasFavoritos.forEach((artista, index) => {
                console.log(`🎵 Procesando artista ${index + 1}:`, artista);
                
                html += `
                    <div class="col-md-6">
                        <div class="artist-card">
                            <div class="card-img-wrapper">
                                <img src="${artista.imagen || '../Imagenes/default-artist.jpg'}" 
                                     alt="${artista.nombre}" 
                                     onerror="this.src='../Imagenes/default-artist.jpg'">
                            </div>
                            <div class="card-content">
                                <h3 class="artist-name">${artista.nombre}</h3>
                                <ul class="artist-details">
                                    <li>${artista.dia}</li>
                                    <li>${artista.escenario}</li>
                                    <li>${artista.horario}</li>
                                </ul>
                                <button class="anotado-btn active" 
                                        onclick="PolipallozaAPI.quitarDeFavoritos(${artista.setlistId}, this)">
                                    En tus favoritos
                                    <i class="bi bi-check-square-fill"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            });
        }

        container.innerHTML = html;
        console.log('✅ Artistas renderizados en la interfaz');
        this.actualizarEstadisticasFavoritos(artistasFavoritos);
    }

    static async quitarDeFavoritos(setlistId, button) {
    try {
        if (confirm('¿Estás seguro de que quieres quitar este artista de tus favoritos?')) {
            // Deshabilitar botón mientras se procesa
            button.disabled = true;
            button.innerHTML = `Quitando... <i class="bi bi-hourglass-split"></i>`;
            
            console.log('❌ Quitando favorito desde perfil - Setlist:', setlistId);
            await this.eliminarFavoritoBackend(setlistId);
            
            // Recargar la lista de favoritos
            await this.mostrarArtistasFavoritosEnPerfil();
            this.mostrarMensaje('✅ Artista removido de favoritos');
        }
    } catch (error) {
        console.error('💥 Error eliminando favorito desde perfil:', error);
        
        let mensajeError = 'Error al remover artista';
        if (error.message.includes('grilla del cliente no existe')) {
            mensajeError = 'Error: No se pudo encontrar tu grilla personal';
        }
        
        this.mostrarMensaje(`❌ ${mensajeError}`);
        
        // Rehabilitar botón en caso de error
        button.disabled = false;
        button.innerHTML = `En tus favoritos <i class="bi bi-check-square-fill"></i>`;
    }
}

    static actualizarEstadisticasFavoritos(artistasFavoritos) {
        const statsElement = document.getElementById('estadisticas-favoritos');
        if (statsElement && artistasFavoritos.length > 0) {
            // Calcular estadísticas reales
            const dias = new Set(artistasFavoritos.map(artista => artista.dia));
            const escenarios = new Set(artistasFavoritos.map(artista => artista.escenario));
            const tiempoEstimado = Math.ceil(artistasFavoritos.length * 1.5);
            
            statsElement.innerHTML = `
                <div class="row text-center">
                    <div class="col-md-3">
                        <h4 class="fw-bold text-primary">${artistasFavoritos.length}</h4>
                        <small class="text-muted">Artistas</small>
                    </div>
                    <div class="col-md-3">
                        <h4 class="fw-bold text-warning">${tiempoEstimado}h</h4>
                        <small class="text-muted">Tiempo estimado</small>
                    </div>
                    <div class="col-md-3">
                        <h4 class="fw-bold text-success">${dias.size}</h4>
                        <small class="text-muted">Días</small>
                    </div>
                    <div class="col-md-3">
                        <h4 class="fw-bold text-info">${escenarios.size}</h4>
                        <small class="text-muted">Escenarios</small>
                    </div>
                </div>
            `;
        } else if (statsElement) {
            statsElement.innerHTML = `
                <div class="row text-center">
                    <div class="col-12">
                        <p class="text-muted">Agrega artistas a favoritos para ver estadísticas</p>
                    </div>
                </div>
            `;
        }
    }

    static mostrarErrorArtistas(mensaje) {
        const container = document.getElementById('artistas-favoritos-container');
        if (container) {
            container.innerHTML = `
                <div class="col-12 text-center py-5">
                    <i class="bi bi-exclamation-triangle display-1 text-warning"></i>
                    <h4 class="text-warning mt-3">Error al cargar artistas</h4>
                    <p class="text-muted">${mensaje}</p>
                    <button class="btn btn-outline-warning mt-3" onclick="PolipallozaAPI.mostrarArtistasFavoritosEnPerfil()">
                        <i class="bi bi-arrow-clockwise"></i> Reintentar
                    </button>
                </div>
            `;
        }
    }

    // ========== MÉTODOS AUXILIARES ==========
    

    static async obtenerArtistaPorId(artistaId) {
        const artistas = await this.cargarArtistasDesdeBackend();
        return artistas[artistaId] || { nombre: 'Artista' };
    }

    // ========== MÉTODOS DE NAVEGACIÓN ==========
    static irAGrilla() {
        window.location.href = '../grilla/index.html';
    }

    static toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        if (sidebar) sidebar.classList.toggle('show');
    }

    static mostrarMensaje(mensaje) {
        // Puedes reemplazar esto con un toast más elegante
        const alertDiv = document.createElement('div');
        alertDiv.className = 'alert alert-info position-fixed top-0 end-0 m-3';
        alertDiv.style.zIndex = '9999';
        alertDiv.innerHTML = mensaje;
        document.body.appendChild(alertDiv);
        
        setTimeout(() => {
            alertDiv.remove();
        }, 3000);
    }

    static cerrarSesion() {
        localStorage.removeItem('usuario');
        localStorage.removeItem('favoritos');
        localStorage.removeItem('favoritosCompletos');
        this.mostrarMensaje('Sesión cerrada');
        setTimeout(() => {
            window.location.href = '../Home/index.html';
        }, 500);
    }

    // ========== MÉTODOS PARA EL PERFIL ==========
    static habilitarEdicion() {
        const inputs = document.querySelectorAll('#formulario-perfil input');
        const btnGuardar = document.getElementById('btn-guardar');
        
        inputs.forEach(input => {
            if (input.id !== 'password') {
                input.readOnly = false;
                input.classList.remove('bg-dark');
                input.classList.add('bg-secondary');
            }
        });
        
        btnGuardar.disabled = false;
        this.mostrarMensaje('Modo edición habilitado');
    }

    static async guardarCambiosPerfil() {
        try {
            // Recopilar datos del formulario
            const datosActualizados = {
                nombre: document.getElementById('input-nombre').value,
                apellido: document.getElementById('input-apellido').value,
                email: document.getElementById('input-email').value,
                direccion: document.getElementById('input-direccion').value,
                telefono: document.getElementById('input-telefono').value
            };

            // Aquí iría la llamada al backend para actualizar los datos
            // await this.actualizarPerfilBackend(datosActualizados);
            
            this.mostrarMensaje('✅ Cambios guardados correctamente');
            
            // Deshabilitar edición nuevamente
            this.deshabilitarEdicion();
            
        } catch (error) {
            console.error('Error guardando cambios:', error);
            this.mostrarMensaje('❌ Error al guardar cambios');
        }
    }

    static deshabilitarEdicion() {
        const inputs = document.querySelectorAll('#formulario-perfil input');
        const btnGuardar = document.getElementById('btn-guardar');
        
        inputs.forEach(input => {
            input.readOnly = true;
            input.classList.remove('bg-secondary');
            input.classList.add('bg-dark');
        });
        
        btnGuardar.disabled = true;
    }

    // ========== MÉTODO cargarPerfil COMPLETO ==========
    static async cargarPerfil() {
        try {
            console.log('👤 EJECUTANDO cargarPerfil()...');
            
            await this.cargarDatosPerfil();
            await this.mostrarArtistasFavoritosEnPerfil();
            
            console.log('✅ cargarPerfil() completado correctamente');
            
        } catch (error) {
            console.error('❌ Error en cargarPerfil:', error);
        }
    }

    // ========== INICIALIZACIÓN PRINCIPAL MEJORADA ==========
    static async inicializar() {
        try {
            console.log('🚀 POLIPALLOZA API - INICIALIZANDO...');
            console.log('📍 URL:', window.location.href);
            
            // Inicializar sistema primero
            await this.inicializarSistema();
            console.log('✅ Sistema base inicializado');
            
            // DETECCIÓN MEJORADA DE PÁGINA
            const path = window.location.pathname;
            console.log('🔍 Analizando path:', path);
            
            // Verificar por elementos del DOM
            const tieneContenedorArtistas = !!document.getElementById('artistas-favoritos-container');
            const tieneContenedorGrilla = !!document.getElementById('grilla-container');
            
            console.log('🎯 Elementos detectados - Artistas:', tieneContenedorArtistas, 'Grilla:', tieneContenedorGrilla);
            
            if (tieneContenedorArtistas || path.includes('perfil')) {
                console.log('🎪 PÁGINA DE PERFIL - Ejecutando cargarPerfil()');
                await this.cargarPerfil();
                
            } else if (tieneContenedorGrilla || path.includes('grilla')) {
                console.log('🎵 PÁGINA DE GRILLA - Ejecutando cargarGrillaCompleta()');
                await this.cargarGrillaCompleta();
                
            } else {
                console.log('🏠 Página principal u otra');
            }
            
            console.log('🎉 INICIALIZACIÓN COMPLETADA EXITOSAMENTE');
            
        } catch (error) {
            console.error('💥 ERROR en inicialización:', error);
        }
    }

    // ========== DATOS DEMO (fallback) ==========
    static obtenerArtistasDemo() {
        return {
            1051: { id: 1051, nombre: "Taichu", imagen: "../Imagenes/default-artist.jpg", dia: "Día 1", escenario: "Escenario Urbano", horario: "13:00 a 13:30", setlistId: 1 },
            1052: { id: 1052, nombre: "Lara91k", imagen: "../Imagenes/default-artist.jpg", dia: "Día 1", escenario: "Escenario Urbano", horario: "13:45 a 14:20", setlistId: 2 },
        };
    }
    // ========== INICIALIZACIÓN CON BACKEND ==========


static mostrarErrorSistema(mensaje) {
    console.error('💥 ERROR DEL SISTEMA:', mensaje);
    
    // Mostrar error en la interfaz si es posible
    if (document.getElementById('nombre-usuario')) {
        document.getElementById('nombre-usuario').textContent = 'Error cargando datos';
        document.getElementById('nombre-usuario').style.color = 'red';
    }
    
    // Crear alerta visible
    const alertDiv = document.createElement('div');
    alertDiv.className = 'alert alert-danger position-fixed top-0 start-0 end-0 m-0 rounded-0';
    alertDiv.style.zIndex = '9999';
    alertDiv.innerHTML = `
        <div class="container">
            <strong>❌ Error de conexión:</strong> ${mensaje}
            <button class="btn btn-sm btn-outline-danger ms-3" onclick="PolipallozaAPI.reintentarConexion()">
                Reintentar
            </button>
        </div>
    `;
    document.body.prepend(alertDiv);
}

static async reintentarConexion() {
    console.log('🔄 Reintentando conexión...');
    
    // Remover alerta de error
    const alerta = document.querySelector('.alert-danger');
    if (alerta) alerta.remove();
    
    try {
        await this.inicializarSistema();
        await this.inicializar();
    } catch (error) {
        console.error('❌ Error en reintento:', error);
    }
}

    static cargarGrillaDemo() {
        const artistas = this.obtenerArtistasDemo();
        const grillaContainer = document.getElementById('grilla-container');
        
        if (!grillaContainer) return;

        let html = '';
        Object.values(artistas).forEach(artista => {
            const esFavorito = this.esFavorito(artista.id);
            const botonEstado = esFavorito ? 'bi-check-square-fill' : 'bi-square';
            const textoBoton = esFavorito ? 'En tu grilla' : 'Agregar a tu grilla';
            const claseActiva = esFavorito ? 'active' : '';
            
            html += `
                <div class="col-md-6">
                    <div class="artist-card">
                        <div class="card-img-wrapper">
                            <img src="${artista.imagen}" alt="${artista.nombre}">
                        </div>
                        <div class="card-content">
                            <h3 class="artist-name">${artista.nombre}</h3>
                            <ul class="artist-details">
                                <li>${artista.dia}</li>
                                <li>${artista.escenario}</li>
                                <li>${artista.horario}</li>
                            </ul>
                            <button class="anotado-btn ${claseActiva}" 
                                    onclick="PolipallozaAPI.toggleFavoritoGrilla(this, ${artista.id}, ${artista.setlistId})">
                                ${textoBoton}
                                <i class="bi ${botonEstado}"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `;
        });

        grillaContainer.innerHTML = html;
        this.actualizarContadorGrilla();
    }
}

// ========== INICIALIZACIÓN AUTOMÁTICA MEJORADA ==========

// Función de inicialización mejorada
function inicializarPolipalloza() {
    console.log('🔧 EJECUTANDO inicialización automática...');
    
    if (typeof PolipallozaAPI !== 'undefined') {
        console.log('✅ PolipallozaAPI disponible, ejecutando inicializar()');
        PolipallozaAPI.inicializar();
    } else {
        console.error('❌ PolipallozaAPI no disponible');
    }
}

// Opción 1: DOMContentLoaded - cuando el HTML está listo
document.addEventListener('DOMContentLoaded', function() {
    console.log('✅ DOMContentLoaded disparado');
    inicializarPolipalloza();
});

// Opción 2: window.onload - cuando toda la página está cargada
window.addEventListener('load', function() {
    console.log('✅ window.load disparado');
    setTimeout(inicializarPolipalloza, 100);
});

// Opción 3: Si ya está cargado (páginas que se cargan rápido)
if (document.readyState === 'complete' || document.readyState === 'interactive') {
    console.log('✅ Página ya cargada, ejecutando inmediatamente');
    setTimeout(inicializarPolipalloza, 100);
}

// Opción 4: Ejecución directa como fallback
console.log('📄 Script polipalloza-api.js cargado');
setTimeout(inicializarPolipalloza, 500);

// Hacer la función global para poder llamarla manualmente
window.inicializarPolipalloza = inicializarPolipalloza;
window.PolipallozaAPI = PolipallozaAPI;