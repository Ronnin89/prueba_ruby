#metodo que contiene la pagina web, con un navbar, un footer y las secciones de contenido del hash 
def build_web_page(data)
    '<!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta author="Ricardo_Alvarez">
        <title>Fotos de la Nasa</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    </head>
    <body style="background-color: #aaa69d;">
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="#">NASA</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse " id="navbarNav">
                        <ul class="navbar-nav ml-auto" >
                            <li class="nav-item active">
                                <a class="nav-link" href="#count">Contador</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#contact">Contacto</a>
                            </li>
                        </ul>
                    </div>
                </div>
                </nav>
        </header>
        <main class="container" style="background-color: #4b6584;">
        <section>
            <h1 style = "text-align: center; font-size: 50px; color: #ffda79 ;" class="py-md-5">Fotos de la NASA</h1>
            <ul style="list-style-type: none;">
            '+ photo(data) +'
            </ul>
            <hr style= "background-color: white; height: 5px ;">
        </section>
        <section id=count>
            <h2 style = "text-align: center; font-size: 30px; color: #ffda79 ;" class="py-md-3">Contador de Fotos</h2>
            <ul class="list-group pb-5">
            ' + cant(data) + '
            </ul>
        </section>
        </main>
        <footer id=contact>
            <div class="ml-auto text-md-center bg-dark">
                <p class="d-inline-block text-light font-weight-bolder">NASA 2021. Todos los derechos reservados.</p>
                <a href="https://www.nasa.gov/"><i class="fas fa-rocket fa-3x p-2 pt-3 active text-light"></i></a>
            </div>
        </footer>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        </body>
    </html>
    '
end
        
#metodo que captura los datos del hashs
def photo(data)
    char_nasa = ''
    data["photos"].each_slice(3) do |photo_nasa| #recorre el el value de photos
        char_nasa += '<div class = "card-deck py-3 pl-5">'
        
        photo_nasa.each do |x| #variable x es la que recorre el hash
            char_nasa += cards(x["img_src"], x["camera"]["full_name"], x["earth_date"])
        end
        
        char_nasa += "</div> \n\n"
    end
    return char_nasa
end

#metodo de contabilizacion y agregado 
def cant(hash)
    list_cam = ''
    n_photo = Hash.new(0) #hash que devuelve el numero de fotos
    hash['photos'].each do |reco|
        x = reco["camera"]["full_name"]# x es una variable creada por mi
        if n_photo[x] 
            n_photo[x] += 1
        else 
            n_photo[x] = 1
        end
    end

    n_photo.each do |key, value|
        list_cam += list_g(key, value.to_s)
    end
    return list_cam
end

#metodo para agregar el contenido del hash a los li
def cards(img, name_cam, date)
    '<li>
    <div class="card border-dark" style="width: 18rem;">
    <img src="'+ img  +'" class="card-img-top" alt="Fotografia propiedad de NASA">
    <div class="card-body">
    <p class="card-text">Detalles de la Fotografia<br> Camara:'+ name_cam +'<br><hr>Earth-date:'+ date +'</p>
    </div>
    </div>
    </li>
    '
end

#metodo para agregar un list group con la cantidad defotos de cada camara
def list_g(name, num)
    '<li class="list-group-item d-flex justify-content-between align-items-center">
    Camara: ' + name + '
    <span class="badge badge-primary badge-pill">'+ num +'</span>
    </li>
    '
end

#metodo para saber la cantidad de fotos de cada camara / pregunta bonus!
def photos_count(hash)
    n_photo = Hash.new(0) #hash que devuelve el numero de fotos
    hash['photos'].each do |reco|
        x = reco["camera"]["full_name"]# x es una variable creada por mi
        if n_photo[x] 
            n_photo[x] += 1
        else 
            n_photo[x] = 1
        end
    end
    return n_photo
end

