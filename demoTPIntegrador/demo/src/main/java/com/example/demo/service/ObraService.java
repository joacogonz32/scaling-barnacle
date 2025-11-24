package com.example.demo.service;

import com.example.demo.model.Obra;
import com.example.demo.model.Valoracion;
import com.example.demo.repository.ObraRepository;
import com.example.demo.repository.ValoracionRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ObraService {

    private final ObraRepository obraRepository;
    private final ValoracionRepository valoracionRepository;

    public ObraService(ObraRepository obraRepository, ValoracionRepository valoracionRepository) {
        this.obraRepository = obraRepository;
        this.valoracionRepository = valoracionRepository;
    }

    // Obtener obra por ID
    public Obra obtenerPorId(Long id) {
        return obraRepository.findById(id).orElse(null);
    }

    // Filtrado combinable por ubicación, época, nombre y popularidad
    public List<Obra> filtrar(String ubicacion, String epoca, String nombre, Float popularidad) {
        return obraRepository.filtrarObras(
                ubicacion != null && !ubicacion.isEmpty() ? ubicacion : null,
                epoca != null && !epoca.isEmpty() ? epoca : null,
                nombre != null && !nombre.isEmpty() ? nombre : null,
                popularidad
        );
    }

    // Top 10 obras por rango de fechas según valoraciones
    public List<Obra> obtenerTop10PorFechas(LocalDate desde, LocalDate hasta) {

        List<Valoracion> valoraciones = valoracionRepository.findByFechaBetween(desde, hasta);

        Map<Obra, double[]> datos = new HashMap<>();

        for (Valoracion v : valoraciones) {
            Obra obra = v.getObra();

            if (!datos.containsKey(obra)) {
                datos.put(obra, new double[]{0, 0});
            }

            datos.get(obra)[0] += v.getPuntaje(); // suma de puntajes
            datos.get(obra)[1] += 1;             // cantidad de valoraciones
        }

        List<Obra> obrasOrdenadas = new ArrayList<>(datos.keySet());

        // Orden descendente por promedio
        obrasOrdenadas.sort((o1, o2) -> {
            double[] d1 = datos.get(o1);
            double[] d2 = datos.get(o2);
            double prom1 = d1[0] / d1[1];
            double prom2 = d2[0] / d2[1];
            return Double.compare(prom2, prom1);
        });

        // Limitar a top 10
        if (obrasOrdenadas.size() > 10) {
            obrasOrdenadas = obrasOrdenadas.subList(0, 10);
        }

        return obrasOrdenadas;
    }
}
