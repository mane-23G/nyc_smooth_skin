import serviceData from '../../data/services.json'
type Service = {
    service: string
    name: string
    booking: string
    link: string
    linktoappt: string
}

export function Services() {
    return (
        <div className='ourServices'>
            <h1>
            Our Services
            </h1>
            <div className='services'>
                {serviceData.map((s: Service) =>
                    <div className='serviceCard'>
                        <p><a href={s.link}>{s.service}</a></p>
                        <div>
                            Service Provider: {s.name}
                            <br></br>
                            <a href={s.linktoappt}>Book an Appointment</a> via {s.booking}
                        </div>
                    </div>
                )}
            </div>
        </div>
    )
}