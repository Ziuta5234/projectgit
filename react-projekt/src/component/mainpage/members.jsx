import { Link } from 'react-router-dom'
import { useState } from 'react'
import Sidebar from './sidebar.jsx'
import '../auth/style.css'
import { useEffect } from 'react'
import './members.css'
import { FiSearch } from 'react-icons/fi'

function Members () {

    const [filters, setFilters] = useState('all')
    const [members, setMembers] = useState([])
    const [search, setSearch] = useState("")

    useEffect( () => {
        fetch("http://localhost/backend/members.php")
            .then(response => response.json())
            .then(data => setMembers(data))
    }, [])

const filtered = members
  .filter(member =>
    `${member.imie} ${member.nazwisko}`
      .toLowerCase()
      .includes(search.toLowerCase())
  )
  .filter(member =>
    filters === 'all' ? true : member.status === filters
  );

    const handleExport = () => {
        if (members.length !== 0) {
            const headers = [
                "imie",
                "nazwisko",
                "email",
                "id_karnetu",
                "data_kupna",
                "data_odnowienia",
                "status",
                "trener",
                "stan_konta",
                "ostatnie_wejscie"
            ]

            const rows = members.map(m => [
                m.imie, m.nazwisko, m.email, m.id_karnetu, m.data_kupna, m.data_odnowienia, m.status, m.trener, m.stan_konta, m.ostatnie_wejscie
            ])

            const csvFile = [
                headers.join(";"),
                ...rows.map(r => r.join(";"))
            ].join("\n")

            const blob = new Blob([csvFile], { type: "text/csv;charset=utf-8;" })
            const url = URL.createObjectURL(blob)

            const link = document.createElement("a");
            link.href = url;
            link.download = "uzytkownicy.csv";
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            URL.revokeObjectURL(url);
        }

    }

    function lack () {
        if (filters == 'all') {
            return "Brak filtrów"
        } else {
            return `Filtr: ${filters}`
        }
    }

    return(
        <div className='maindiv'>
            <Sidebar/>
            <div className="mainContainer-members">
                <div className="header-of-members">
                    <h1>UZYTKOWNICY</h1>
                    <p>Zarządzaj swoimi klientami siłowni, wyświetlaj profile i śledź karnety</p>
                </div>
                <div className="filter-of-members">
                    <div className="first-row-filter">
                        <div className="filter-input-div">
                            <FiSearch className="iconSearch"/>
                            <input placeholder='Wyszukaj uzytkownika...' type="text" onChange={(e) => setSearch(e.target.value)}/>
                        </div>
                        <div className="right-row-filter">
                            <select value={filters} onChange={(e) => setFilters(e.target.value)}>
                                <option value="all">Wybierz Filtr</option>
                                <option value="Nieaktywny">Nieaktywne</option>
                                <option value="Aktywny">Aktywne</option>
                                <option value="Zamrożony">Zamrozone</option>
                            </select>
                            <button onClick={handleExport}>Export</button>
                        </div>
                    </div>
                    <hr />
                    <div className="second-row-filter">
                        <p>{lack()}</p>
                    </div>
                </div>
                <div>
                    <div className='filterspartnershipsValue-div dataClients'>
                        <p className='cell'>UZYTKOWNIK: </p>
                        <p className='cell'>ID KARNETU: </p>
                        <p className='cell'>KUPNO: </p>
                        <p className='cell'>ODNOWIENIE: </p>
                        <p className='cell'>STATUS: </p>
                        <p className='cell'>TRENER: </p>
                        <p className='cell'>STAN KONTA: </p>
                        <p className='cell'>OSTATNIE WEJSCIE: </p>
                    </div>
                    {filtered.map((name) => (
                        <div className='partnershipsValue-div' key={name.id_karnetu}>
                            <div className='dataClients'>
                                <div className='cell firstDatas'>
                                    <h1>{name.imie} <span>{name.nazwisko}</span></h1>
                                    <p>{name.email}</p>
                                </div>
                                <p className='cell'>{name.id_karnetu}</p>
                                <p className='cell'>{name.data_kupna}</p>
                                <p className='cell'>{name.data_odnowienia}</p>
                                <p className='cell'>{name.status}</p>
                                <p className='cell'>{name.trener}</p>
                                <p className='cell'>{name.stan_konta}</p>
                                <p className='cell'>{name.ostatnie_wejscie}</p>
                            </div>
                        </div>
                    ))}
                </div>
                {/* <Memberslist/> */}
            </div>
        </div>
    );
}

export default Members